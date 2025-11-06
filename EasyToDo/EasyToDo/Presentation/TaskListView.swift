//
//  TaskListView.swift
//  EasyToDo
//
//  Created by Jorge Mayta on 5/11/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TaskListViewModel()
    @State var showAddTask: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks, id: \.self.id) { task in
                    Text(task.name)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddTask.toggle()
                        
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                TaskDetailView {
                    showAddTask.toggle()
                } save: { name in
                    showAddTask.toggle()
                    viewModel.addTask(name: name)
                }

            }
        }
        
    }
}

#Preview {
    TaskListView()
}
