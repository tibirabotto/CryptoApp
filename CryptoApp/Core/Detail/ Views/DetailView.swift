//
//  DetailView.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-11.
//

import SwiftUI


struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
        
    }
}

struct DetailView: View {
    
    @StateObject var vm: DetailViewModal
    
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModal(coin: coin))
    }
    
    var body: some View {
        Text("Hello")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
