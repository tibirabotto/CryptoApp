//
//  HomeViewModal.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-08.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portolioCoins.append(DeveloperPreview.instance.coin)
        })
    }
}
