//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Schild on 6/21/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var showingShareToDoListView = false
    @Published var allItems = [ToDoListItem]()
    @Published var toDoListId = ""
    private var userId: String
    private var db = Firestore.firestore()
    
    init(userId: String) {
        self.userId = userId
        //self.toDoListId = userId
        fetchAllItems()
    }
    
    
    func fetchAllItems() {
        // Fetch user's own todos
        db.collection("users").document(userId).collection("todos").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let ownItems = documents.compactMap { queryDocumentSnapshot -> ToDoListItem? in
                try? queryDocumentSnapshot.data(as: ToDoListItem.self)
            }
            
            self.allItems = ownItems
            
            // Now fetch shared lists
            self.fetchSharedLists()
        }
    }
        
    func fetchSharedLists() {
        db.collection("users").document(userId).getDocument { document, error in
            guard let document = document, document.exists,
                  let sharedLists = document.data()?["sharedLists"] as? [String] else {
                return
            }
            
            for sharedUserId in sharedLists {
                self.db.collection("users").document(sharedUserId).collection("todos").addSnapshotListener { querySnapshot, error in
                                guard let documents = querySnapshot?.documents else { return }
                                
                                let sharedItems = documents.compactMap { queryDocumentSnapshot -> ToDoListItem? in
                                    try? queryDocumentSnapshot.data(as: ToDoListItem.self)
                                }
                                
                                DispatchQueue.main.async {
                                    // Remove old items from this user before adding new ones
                                    //self.allItems.removeAll { $0.ownerId == sharedUserId }
                                    self.allItems.append(contentsOf: sharedItems)
                                }
                            }
            }
        }
    }
    
    // Delete to do list item
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

