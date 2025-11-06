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
    
    func addTask(task: Task) {
        tasks.append(task)
        dao.insert(task: task)
    }
    
    func deleteTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
            dao.delete(task: task)
        }
    }
    
    func updateTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            dao.update(task: task)
        }
    }
    
    func getAllTasks() {
       tasks = dao.fetchAll()
    }
    
    init() {
        getAllTasks()
    }
}
