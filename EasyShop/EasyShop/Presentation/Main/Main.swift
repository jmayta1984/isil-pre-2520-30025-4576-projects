//
//  Main.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Home()
            }
            Tab("Favorites", systemImage: "heart") {

            }
            Tab("Shopping", systemImage: "bag"){
                Cart()
            }
            Tab("Profile", systemImage: "person") {
                
            }
        }
        .navigationBarBackButtonHidden()
        .tint(.black)
    }
}

#Preview {
    Main()
}
