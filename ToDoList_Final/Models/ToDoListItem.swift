//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Jonathan Schild on 6/21/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    let ownerId: String
    var isDone: Bool
 
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}



