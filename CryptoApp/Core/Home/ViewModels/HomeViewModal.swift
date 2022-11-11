//
//  HomeViewModal.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-08.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject {
    
    
    @Published var statistics: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubScribers()
    }
    
    
    func addSubScribers() {
        
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { coinModels, portfolioEntities -> [CoinModel] in
                coinModels
                    .compactMap { coin -> CoinModel? in
                        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] returnedCoins in
                self?.portolioCoins = returnedCoins
            }
            .store(in: &cancellables)

    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowerCasedText = text.lowercased()
        
        return coins.filter { coin -> Bool in
            return  coin.name.lowercased().contains(lowerCasedText) ||
                    coin.symbol.lowercased().contains(lowerCasedText) ||
                    coin.id.lowercased().contains(lowerCasedText)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        
        return stats
    }
        
    
}
