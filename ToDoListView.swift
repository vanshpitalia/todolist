//
//  ToDoListItemsView.swift
//  todolist
//
//  Created by Vansh Pitalia on 23/06/23.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView:View {
    @StateObject var ViewModel:ToDoListViewViewModel
    @FirestoreQuery var items:[ToDOListItem]
    
    
    
    init(userId:String){
        self._items = FirestoreQuery(
            collectionPath:"users/\(userId)/todos"
        )
        self._ViewModel=StateObject(wrappedValue:ToDoListViewViewModel(userId:userId) )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    todolistitemview(item: item)
                        .swipeActions{
                            Button("Delete"){
                                ViewModel.delete(id: item.id )
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .navigationTitle ("To Do List")
            .toolbar {
                Button{
                    ViewModel.showingNewItemView=true
            } label: {
            Image (systemName: "plus")
            
                }

                }
            .sheet(isPresented: $ViewModel.showingNewItemView){
                NewItemsView(newItemPresented: $ViewModel.showingNewItemView)
            }
            }
        }
    }


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId:"fvd8dPnhctSOiIngw9VhZVDZ9Pg2")
    }
}
