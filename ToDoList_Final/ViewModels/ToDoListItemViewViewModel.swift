//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Schild and Paul Kelly on 6/21/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        
        // Set it to the inverse
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
