//
//  LoginView.swift
//  todolist
//
//  Created by Vansh Pitalia on 23/06/23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                 //header
                HeaderView(title: "Listify", subtitle:"Tackle Your To-Dos with Ease", angle:-15, background:.cyan)
                   
               //login form
              Form{
                    if !viewModel.ErrorMessage.isEmpty{
                       Text(viewModel.ErrorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    
                    TextField ( "Email Address",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none) 
                    
                    SecureField ( "Password", text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                   
                    TLButton(title:"Log In", background:.cyan){
                        viewModel.login()
                        
                    }
                    
                    .padding()
                    
                    
                }
                .offset(y:-40)
                //create account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                    }
                .padding(.bottom,20)
               Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
