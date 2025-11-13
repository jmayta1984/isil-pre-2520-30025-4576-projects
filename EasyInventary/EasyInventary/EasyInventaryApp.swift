//
//  EasyInventaryApp.swift
//  EasyInventary
//
//  Created by Jorge Mayta on 5/11/25.
//

import SwiftUI
import SwiftData

@main
struct EasyInventaryApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView()
        }
        .modelContainer(for: Product.self)
    }
}
