//
//  ContentView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Welcome to SwiftUI!")
            
            Button("Test") {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
