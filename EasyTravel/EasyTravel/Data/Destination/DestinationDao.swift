//
//  DestinationDao.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftData
import Foundation

class DestinationDao {
    
    static let shared = DestinationDao()
    
    private init() {}
    
    let context = PersistenceController.shared.container.mainContext
    
    func insert(destination: Destination) {
        let entity = DestinationEntity(id: destination.id, title: destination.title, posterPath: destination.posterPath, overview: destination.overview)
        context.insert(entity)
        saveContext()
    }
    
    func delete(destination: Destination) {
        do {
            let entities = try context.fetch(FetchDescriptor<DestinationEntity>())
            if let entity =  entities.first(where: { $0.id == destination.id }) {
                context.delete(entity)
                saveContext()
            }
           
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func getAll() -> [Destination] {
        do {
            let entities = try context.fetch(FetchDescriptor<DestinationEntity>())
            return entities.map { entity in
                Destination(id: entity.id, title: entity.title, posterPath: entity.posterPath, overview: entity.overview)
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
       
    }
    
    func saveContext() {
        try? context.save()
    }
}
