//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-07.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @State private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
