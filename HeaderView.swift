//
//  HeaderView.swift
//  todolist
//
//  Created by Vansh Pitalia on 26/06/23.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle:String
    let angle:Double
    let background:Color
    
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius:0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees:angle))
                 
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subtitle )
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                 
            }
            .padding(.top,60 )
        }
        .frame(width: UIScreen.main.bounds.width * 3,
          height: 350 )
        .offset(y:-130)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title:"string", subtitle: "substring", angle:15, background:.cyan)
    }
}
