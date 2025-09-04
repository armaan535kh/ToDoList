//
//  TodoItem.swift
//  ToDoList
//
//  Created by Armaan Khan  on 04/09/25.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    let dateCreated: Date
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
        self.dateCreated = Date()
    }
}
