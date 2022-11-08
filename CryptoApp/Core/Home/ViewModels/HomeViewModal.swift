//
//  HomeViewModal.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-08.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubScribers()
    }
    
    
    func addSubScribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
}
