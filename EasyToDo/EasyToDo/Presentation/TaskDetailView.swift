//
//  TaskDetailView.swift
//  EasyToDo
//
//  Created by Jorge Mayta on 5/11/25.
//

import SwiftUI

struct TaskDetailView: View {
    let cancel: () -> Void
    let save: (String) -> Void
    
    @State var name = ""
    
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    TextField("Name", text: $name)
                        .autocorrectionDisabled()
                }
            }
            .navigationTitle(Text("New task"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: cancel) {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        save(name)
                    }) {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}
