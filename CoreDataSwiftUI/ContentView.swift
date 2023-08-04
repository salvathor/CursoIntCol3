//
//  ContentView.swift
//  CoreDataSwiftUI
//
//  Created by Salvador Lopez on 04/08/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.id, ascending: true)],
        animation: .default)
    
    private var users: FetchedResults<User>
    
    @State var id: UUID!
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Username")
                        .frame(width: 100, height: 35,alignment: .leading)
                    Text("Email")
                        .frame(width: 100, height: 35,alignment: .leading)
                    Text("Password")
                        .frame(width: 100, height: 35,alignment: .leading)
                }
                .padding()
                VStack{
                    TextField("Ingresa tu nombre de usuario", text: $username)
                        .textFieldStyle(.roundedBorder)
                    TextField("Ingresa tu email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    TextField("Ingresa tu password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
            }
            .padding()
            HStack{
                Button{
                    if username != "" && email != "" && password != "" {
                        print("Saving...")
                        addUser(name: username, email: email, pass: password)
                    }
                } label: {
                    Text("Save")
                        .frame(width: 100,height: 34,alignment: .center)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
                Button{
                    if let id = self.id {
                        print("Updating...")
                        updateUser(id: id, name: self.username, email: self.email, pass: self.password)
                    }
                } label: {
                    Text("Update")
                        .frame(width: 100,height: 34,alignment: .center)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            NavigationView{
                List{
                    ForEach(users){
                        user in
                        Text(user.username!)
                            .onTapGesture{
                                id = user.id
                                username = user.username!
                                email = user.email!
                                password = user.password!
                            }
                    }
                    .onDelete(perform: deleteUser)
                }
            }
        }
    }
    
    private func addUser(name: String, email: String, pass: String){
        let user = User(context: viewContext)
        
        user.id = UUID()
        user.username = self.username
        user.email = self.email
        user.password = self.password
        
        do{
            try viewContext.save()
        }catch{
            print("Error: \(error)")
        }
    }
    
    private func updateUser(id: UUID, name: String, email: String, pass: String){
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let results = try viewContext.fetch(fetchRequest)
            if let userResult = results.first {
                userResult.username = self.username
                userResult.email = self.email
                userResult.password = self.password
                try viewContext.save()
            }
        }catch{
            print("Error: \(error)")
        }
    }
    
    private func deleteUser(offset: IndexSet){
        offset.map {users[$0]}.forEach(viewContext.delete)
        do {
            try viewContext.save()
        }catch{
            print("Error deleting: \(error)")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
