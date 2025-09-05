//
//  TodoViewModel.swift
//  ToDoList
//
//  Created by Armaan Khan  on 04/09/25.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    @Published var todoItems: [TodoItem] = []
    
    init () {
        loadTodos()
    }
    
    //CRUD OPERATION
    
    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        todoItems.append(newTodo)
        saveTodo()
    }
    
    func toggleCompletion(for todo: TodoItem) {
        if let index = todoItems.firstIndex(where: {$0.id == todo.id}) {
            todoItems[index].isCompleted.toggle()
            saveTodo()
        }
    }
    
    func deleteTodo(at indexset: IndexSet) {
        todoItems.remove(atOffsets: indexset)
        saveTodo()
    }
    
    
    
    private func saveTodo() {
        if let encoded = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.set(encoded, forKey: "todoItems")
        }
    }
    
    private func loadTodos() {
            if let data = UserDefaults.standard.data(forKey: "TodoItems"),
               let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
                todoItems = decoded
            }
    }
}
