//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jonathan Schild and Paul Kelly on 6/21/24.
//  Citation: iOS Academy tutorials
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
