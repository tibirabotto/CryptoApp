//
//  DetailViewModal.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-11.
//

import Foundation
import Combine

class DetailViewModal: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returedCoinDetails in
                print(returedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
