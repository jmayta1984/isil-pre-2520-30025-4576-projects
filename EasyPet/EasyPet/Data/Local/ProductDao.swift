//
//  ProductDao.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

import CoreData

class ProductDao {
    
    static let shared = ProductDao()
    
    private init() {}
    
    let context = PersistenceController.shared.container.viewContext
    
    func insert(product: Product) {
        let entity = ProductEntity(context: context)
        entity.id = Int16(product.id)
        entity.title = product.title
        entity.price = product.price
        entity.overview = product.description
        entity.image = product.image
        saveContext()
    }
    
    func delete(id: Int) {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %i", id)
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAllIds() -> [Int] {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        
        
        do {
            let entities = try context.fetch(request)
            return entities.map({Int($0.id)})
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if (context.hasChanges){
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }

    
}
