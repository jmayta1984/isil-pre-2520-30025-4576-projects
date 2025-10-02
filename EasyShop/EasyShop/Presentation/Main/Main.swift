//
//  Main.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        TabView (selection: $router.selectedTab) {
            
            Tab("Home", systemImage: "house", value: 0) {
                Home()
            }
            
            Tab("Favorites", systemImage: "heart", value: 1) {
                
            }
            Tab("Shopping", systemImage: "bag", value: 2){
                CartView()
            }
            Tab("Profile", systemImage: "person", value: 3) {
                
            }
            
        }
        .navigationBarBackButtonHidden()
        .tint(.black)
    }
}

#Preview {
    Main()
}

class AppRouter: ObservableObject {
    @Published var selectedTab = 0
}
