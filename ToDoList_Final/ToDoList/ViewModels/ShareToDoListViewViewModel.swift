//
//  ShareToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Schild and Paul Kelly on 7/1/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ShareToDoListViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var errorMessage: String?
    @Published var successMessage: String?
    
    private var db = Firestore.firestore()
    
    init() {}
    
    func share(toDoListId: String) {
        // Clear previous messages
        self.errorMessage = nil
        self.successMessage = nil
        
        // Find the user with the supplied email address
        db.collection("users").whereField("email", isEqualTo: email).getDocuments { querySnapshot, error in
            if let error = error {
                self.errorMessage = "Error verifying email: \(error.localizedDescription)"
                return
            }
            
            guard let documents = querySnapshot?.documents, !documents.isEmpty else {
                self.errorMessage = "No user found with this email."
                return
            }
            
            //
            let targetUserId = documents.first!.documentID
            

            
            // Update the users document to include the shared list
            self.db.collection("todos").document(targetUserId).updateData([
                "sharedWith": FieldValue.arrayUnion([toDoListId])
            ]) { error in
                if let error = error {
                    self.errorMessage = "Error sharing to-do list: \(error.localizedDescription)"
                } else {
                    self.successMessage = "To-do list shared successfully!"
                }
            }
        }
    }
}

