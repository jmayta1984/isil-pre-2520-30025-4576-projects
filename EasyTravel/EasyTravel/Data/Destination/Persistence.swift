//
//  Persistence.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftData
import Foundation

class PersistenceController {
    
    static let shared = PersistenceController()
    
    private init() {
        do {
            container = try ModelContainer(for: DestinationEntity.self)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    let container: ModelContainer
    
}
