//
//  ContentView.swift
//  EasyAnimations
//
//  Created by Jorge Mayta on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Implicit", systemImage: "circle") {
                ImplicitAnimation()
            }
            Tab("Explicit", systemImage: "rectangle") {
                ExplicitAnimation()
            }
            
            Tab("Transition", systemImage: "rectangle") {
                TransitionAnimation()
            }
            Tab("Infinite", systemImage: "arrow.2.circlepath.circle") {
                InfiniteAnimation()
            }
        }
    }
}

#Preview {
    ContentView()
}
