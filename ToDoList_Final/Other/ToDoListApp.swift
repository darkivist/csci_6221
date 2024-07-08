//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jonathan Schild on 6/21/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    // initiate authenticator
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
