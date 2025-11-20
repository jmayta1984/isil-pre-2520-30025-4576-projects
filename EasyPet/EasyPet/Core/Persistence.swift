//
//  Persistence.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "EasyPetModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
