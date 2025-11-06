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
    @State var selectedTask: Task? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.name)
                        .onTapGesture {
                            selectedTask = task
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteTask(task: task)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }

                        }
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
                } save: { task in
                    showAddTask.toggle()
                    viewModel.addTask(task: task)
                }

            }
            .sheet(item: $selectedTask) { task in
                TaskDetailView(task: task) {
                    selectedTask = nil
                } save: { task in
                    selectedTask = nil
                    viewModel.updateTask(task: task)
                }

            }
        }
        
    }
}

#Preview {
    TaskListView()
}
