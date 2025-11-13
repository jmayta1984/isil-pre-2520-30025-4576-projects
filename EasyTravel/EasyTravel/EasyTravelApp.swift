//
//  EasyTravelApp.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 22/10/25.
//

import SwiftUI
import SwiftData

@main
struct EasyTravelApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(DestinationListViewModel())
        }
    }
}
