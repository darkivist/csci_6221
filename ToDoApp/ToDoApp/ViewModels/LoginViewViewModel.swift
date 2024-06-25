//
//  LoginViewViewModel.swift
//  ToDoApp
//
//  Created by Jonathan Schild and Paul Kelly on 6/23/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        //Try to log user in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate () -> Bool {
        errorMessage=""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please complete all fields"
            return false
        }
        
        //email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage="Please enter a valid email address"
            return false
        }
        return true
    }
}
