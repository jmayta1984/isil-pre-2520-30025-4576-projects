//
//  TaskDetailView.swift
//  EasyToDo
//
//  Created by Jorge Mayta on 5/11/25.
//

import SwiftUI

struct TaskDetailView: View {
    @State var name = ""

    var task: Task?
    let cancel: () -> Void
    let save: (Task) -> Void
    
    
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    TextField("Name", text: $name)
                        .autocorrectionDisabled()
                }
            }
            .navigationTitle(Text(task == nil ? "New task" : "Edit task" ))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: cancel) {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        save(Task(id: task?.id ?? UUID(), name: name))
                    }) {
                        Image(systemName: "checkmark")
                    }
                }
            }
            .onAppear {
                if let task = task {
                    self.name = task.name
                }
            }
        }
    }
}
