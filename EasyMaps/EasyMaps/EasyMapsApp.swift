//
//  EasyMapsApp.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

import SwiftUI

@main
struct EasyMapsApp: App {
    let helper = GoogleMapHelper.shared
    var body: some Scene {
        WindowGroup {
            StoresView()
        }
    }
}
