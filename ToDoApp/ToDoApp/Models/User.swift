//
//  User.swift
//  ToDoApp
//
//  Created by Jonathan Schild and Paul Kelly on 6/23/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
