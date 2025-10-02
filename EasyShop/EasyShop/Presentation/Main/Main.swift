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
            
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(1)
            
            CartView()
                .tabItem {
                    Label("Shopping", systemImage: "bag")
                }
                .tag(2)
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(3)
            /*
             Tab("Home", systemImage: "house") {
                 Home()
             }
             
             Tab("Favorites", systemImage: "heart") {

             }
             Tab("Shopping", systemImage: "bag"){
                 CartView()
             }
             Tab("Profile", systemImage: "person") {
                 
             }
             */
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
