//
//  RegisterView.swift
//  ToDoList
//
//  Created by Jonathan Schild on 6/21/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start Organizing To Dos",
                       angle: -15,
                       background: Color(red: 168/255, green: 153/255, blue: 104/255))
            
            // Form to fill out
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account",
                         background: Color(red: 0/255, green: 59/255, blue: 92/255)) {
                    viewModel.register()
                }
                //.padding()
            }
            .offset(y: -50)
            
            // Move banner upwards
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
