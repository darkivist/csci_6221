//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Jonathan Schild and Paul Kelly on 6/21/24.
//

import Foundation

struct ToDoLists: Codable, Identifiable {
    let id: String
    let subject: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
 
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}



