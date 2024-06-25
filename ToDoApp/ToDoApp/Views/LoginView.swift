//
//  LoginView.swift
//  ToDoApp
//
//  Created by Paul Kelly on 6/23/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Final Project",
                           subtitle: "Jon Schild/Paul Kelly, CSCI 6221, Summer 2024",
                           angle: 15,
                           background: Color(red: 0/255, green: 59/255, blue: 92/255))
                
                Form {
                    //Login Form
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }

                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log In",
                             background: Color(red: 168/255, green: 153/255, blue: 104/255)
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-50)
                
                //Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
