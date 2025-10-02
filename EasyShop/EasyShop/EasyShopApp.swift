//
//  EasyShopApp.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

@main
struct EasyShopApp: App {
    @StateObject var cartViewModel = CartViewModel()
    @StateObject var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            OnBoarding()
                .environmentObject(cartViewModel)
                .environmentObject(router)
        }
    }
}
