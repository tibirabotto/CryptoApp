//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-10.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var seletedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoList
                    
                    if seletedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            }
            .onChange(of: vm.searchText) { value in
                if value == "" {
                        removeSeletedCoin()
                }
            }
        }
        
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSeleteedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(seletedCoin?.id == coin.id ?
                                        Color.theme.green : Color.clear
                                        , lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        })
    }
    
    private func updateSeleteedCoin(coin: CoinModel) {
        seletedCoin = coin
        
        if let portfolioCoin = vm.portolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (seletedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            Divider()
            HStack {
                Text("Current price of \(seletedCoin?.symbol.uppercased() ?? ""): ")
                Spacer()
                Text(seletedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: 0)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            Button {
                saveButtonOnPressed()
            } label: {
                Text("Save".uppercased())
            }
            .opacity(
                (seletedCoin != nil && seletedCoin?.currentHoldings != Double(quantityText)) ?
                1.0 : 0.0
                
            )
        }
        .font(.headline)
    }
    
    private func saveButtonOnPressed() {
        guard let coin = seletedCoin,
              let amount = Double(quantityText)
              else {return}
        
        vm.updatePortfolio(coin: coin, amount: amount)
        
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSeletedCoin()
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeIn) {
                showCheckMark = false
                
            }
        }
        
    }
    
    private func removeSeletedCoin() {
        seletedCoin = nil
        vm.searchText = ""
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}
