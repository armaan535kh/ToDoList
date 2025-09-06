//
//  TodoRowView.swift
//  ToDoList
//
//  Created by Armaan Khan  on 05/09/25.
//

import SwiftUI

struct TodoRowView: View {
    
    let todo: TodoItem
    let viewModel: TodoViewModel
    
    var body: some View {
        HStack {
            Text(todo.title)
                .strikethrough(todo.isCompleted)
                .foregroundStyle(todo.isCompleted ? .gray : .primary)
            
            Spacer()
            
            Button( action: {viewModel.toggleCompletion(for: todo)}) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(todo.isCompleted ? .green : .gray)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.toggleCompletion(for: todo)
        }
    }
}

#Preview {
    TodoRowView(
        todo: TodoItem(title: "Sample Todo", isCompleted: false),
                viewModel: TodoViewModel()
    )
}
