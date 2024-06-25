//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Paul Kelly on 6/23/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
