//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Jonathan Schild on 6/21/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel

    init(userId: String) {
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.allItems) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                
                // add share button in upper left
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.showingShareToDoListView = true
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                
                // add to do list button in upper right
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            } 
            
            // go to new item view screen when clicked
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
            // go to share screen when clicked
            .sheet(isPresented: $viewModel.showingShareToDoListView) {
                ShareToDoListView(sharePresented: $viewModel.showingShareToDoListView, toDoListId: viewModel.toDoListId)
                        }
        }
    }
}



#Preview {
    ToDoListView(userId: "PtIHsS64kTYsaaZKhH1bvwMuqDx2")
}
