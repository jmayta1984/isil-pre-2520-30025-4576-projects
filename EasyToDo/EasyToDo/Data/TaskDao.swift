//
//  TaskDao.swift
//  EasyToDo
//
//  Created by Jorge Mayta on 5/11/25.
//


import CoreData

class TaskDao {
    
    static let shared = TaskDao()
    
    private init(){}
    
    let context = PersistenceController.shared.container.viewContext
    
    func insert(task: Task) {
        let entity = TaskEntity(context: context)
        entity.id = task.id
        entity.name = task.name
        saveContext()
    }
    
    
    func fetchAll() -> [Task] {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map { entity in
                Task(id: entity.id ?? UUID(), name: entity.name ?? "")
            }
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
