//
//  ContentView.swift
//  SwiftUIConsumoREST
//
//  Created by Salvador Lopez on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [User] = []
    
    var body: some View {
        NavigationView{
            List(users){
                user in
                NavigationLink(destination: DetailUserView(user: user)){
                    Text(user.name!)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("User List")
        }
        .onAppear{
            getData("https://jsonplaceholder.typicode.com/users") { fetchedUsers in
                self.users = fetchedUsers
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
