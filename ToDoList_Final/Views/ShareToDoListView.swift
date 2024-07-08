//
//  ShareToListView.swift
//  ToDoList
//
//  Created by Jonathan Schild on 7/1/24.
//

import SwiftUI

struct ShareToDoListView: View {
    @Binding var sharePresented: Bool
    @StateObject var viewModel = ShareToDoListViewViewModel()
    var toDoListId: String
    
    var body: some View {
        VStack { // Get the email address, pass it to the share viewmodel, 
            TextField("Enter email to share with", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()
            
            Button(action: {
                viewModel.share(toDoListId: toDoListId)
            }) {
                Text("Share")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if let successMessage = viewModel.successMessage {
                Text(successMessage)
                    .foregroundColor(.green)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    ShareToDoListView(sharePresented: Binding(get: {
        return true
    }, set: { _ in
        
    }),
    toDoListId: "PtIHsS64kTYsaaZKhH1bvwMuqDx2"
    )
}

