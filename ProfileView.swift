//
//  ProfileView.swift
//  todolist
//
//  Created by Vansh Pitalia on 23/06/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var ViewModel=ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user=ViewModel.user{
                    profile(user:user)
                    
                }
                else{
                    Text("Loading Profile... ")
                
                    
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            ViewModel.fetchUser()
        }
        
    }
    @ViewBuilder
    func profile(user:User) -> some View {
        //avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode:.fit)
            .foregroundColor(Color.cyan)
            .frame(width:125,height:125 )
            .padding()
        //info
        VStack(alignment: .leading) {
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970:user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        //sign out
        Button("Log Out"){
            ViewModel.logout()
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
