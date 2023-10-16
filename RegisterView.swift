//
//  RegisterView.swift
//  todolist
//
//  Created by Vansh Pitalia on 23/06/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel=RegisterViewViewModel()
    var body: some View {
        VStack{
            //header
            HeaderView(title:"Listify", subtitle:"Take control of your to-do list. Register!", angle:15  , background:.green)
            
            Form{
                TextField("Full Name",text: $viewModel.name )
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address",text: $viewModel.email )
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password ",text: $viewModel.password  )
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title:"Create Account ", background:.green){
                    
                    viewModel.register()
                  //attempt registration
                    
                }
                .padding()
            }
            
            
            .offset(y:-30)
           Spacer()   
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
