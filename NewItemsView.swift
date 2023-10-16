//
//  NewItemsView.swift
//  todolist
//
//  Created by Vansh Pitalia on 23/06/23.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemsViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,80)
            
            Form{
                //title
                TextField("Title",text:$viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle() )
                //due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                TLButton(title:"Save",
                         background:.orange){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert=true
                    }
                }
                         .padding()
            }
            .alert(isPresented:$viewModel.showAlert){
                Alert(title: Text("Error"),message: Text( "Please fill in all fields and select due date that is today or in future."))
            } 
        }
        
    }
}

struct NewItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemsView(newItemPresented: Binding(get:{
            return true},
                                               set:{_ in }
                                              ))
    }
}
