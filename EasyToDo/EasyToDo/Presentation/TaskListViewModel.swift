//
//  TaskListViewModel.swift
//  EasyToDo
//
//  Created by Jorge Mayta on 5/11/25.
//

import Combine
import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    let dao = TaskDao.shared
    
    func addTask(name: String) {
        let task = Task(id: UUID(), name: name)
        dao.insert(task: task)
    }
    
    func deleteTask() {
        
    }
    
    func updateTask() {
        
    }
    
    func getAllTasks() {
       tasks = dao.fetchAll()
    }
    
    init() {
        getAllTasks()
    }
}
