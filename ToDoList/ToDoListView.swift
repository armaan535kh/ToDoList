//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Armaan Khan  on 04/09/25.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTaskTitle = ""
    @State private var showingAddTask = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todoItems) { todo in
                    TodoRowView(todo: todo, viewModel: viewModel)
                }
                .onDelete(perform: viewModel.deleteTodo)
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAddTask = true
                    }
                }
            }
            .alert("New Task", isPresented: $showingAddTask) {
                Button("Add") {
                    if !newTaskTitle.isEmpty {
                        viewModel.addTodo(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                }
                
                Button ("Cancel", role: .cancel) {
                    newTaskTitle = ""
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
