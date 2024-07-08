//
//  LoginView.swift
//  ToDoList
//
//  Created by Jonathan Schild on 6/21/24.
//

import SwiftUI

struct LoginView: View {
    // Database holding logins/passwords
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "GWU CSCI 6221, Summer 2024",
                           angle: 15,
                           background: Color(red: 0/255, green: 59/255, blue: 92/255))

                // Login form
                Form {
                    
                    // Error if missing field
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    // Fill in fields
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        //.padding(5)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        //.padding(5)
                    
                    TLButton(title: "Log In", 
                             background: Color(red: 168/255, green: 153/255, blue: 104/255)) {
                        viewModel.login()
                    }
                    //.padding()
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create Account", destination: RegisterView())
                }
                .padding(.bottom, 20)
                
                // Move and center upward the shape, text
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
