//
//  EasyToDoApp.swift
//  EasyToDo
//
//  Created by Jorge Mayta on 5/11/25.
//

import SwiftUI
import CoreData

@main
struct EasyToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
