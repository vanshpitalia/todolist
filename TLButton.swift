//
//  TLButton.swift
//  todolist
//
//  Created by Vansh Pitalia on 26/06/23.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background:Color
    let action: () -> Void
    
    var body: some View {
        Button {
         action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title:"button", background:.orange) {
            //action  
        }
        
    }
}
