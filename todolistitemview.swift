//
//  todolistitemview.swift
//  todolist
//
//  Created by Vansh Pitalia on 23/06/23.
//

import SwiftUI

struct todolistitemview: View {
@StateObject var viewModel=todolistitemViewViewModel()
    let item: ToDOListItem
    var body: some View {
    HStack {
        VStack(alignment: .leading){
    Text(item.title)
                .font(.body)
    Text ("\(Date(timeIntervalSince1970:item.dueDate) .formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
        Spacer()
        
        Button{
            viewModel.toggleIsDone(item:item)
            
        }
    label:{
        Image(systemName:item.isdone ?"checkmark.circle.fill":"circle")
            .foregroundColor(Color.blue)
    }
        
        
        
        }
    .padding()
        
    }
}

struct todolistitemview_Previews: PreviewProvider {
    static var previews: some View {
        todolistitemview(item: .init(id:"abc" ,
                                     title: "hey",
                                     dueDate:Date().timeIntervalSince1970,
                                     createdDate:Date().timeIntervalSince1970  ,
                                     isdone: true)
        )
    }
}
