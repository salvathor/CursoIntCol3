//
//  DetailUserView.swift
//  SwiftUIConsumoREST
//
//  Created by Salvador Lopez on 28/07/23.
//

import SwiftUI

struct DetailUserView: View {
    var user: User
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .frame(width: 210,height: 210)
                Image("Linux-Logo-1996-present")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .background(.yellow)
                    .cornerRadius(100)
            }
            VStack{
                Text(user.name!)
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundColor(.blue)
                Text(user.email!)
                    .font(.body)
                    .fontWeight(.thin)
            }
            VStack{
                TextField("Name", text: .constant(user.name!))
                    .textFieldStyle(.roundedBorder)
                TextField("User Name", text: .constant(user.username!))
                    .textFieldStyle(.roundedBorder)
                TextField("Correo", text: .constant(user.email!))
                    .textFieldStyle(.roundedBorder)
                TextField("Telefono", text: .constant(user.phone!))
                    .textFieldStyle(.roundedBorder)
                TextField("Website", text: .constant(user.website!))
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            Button{
                //TODO: Save this item...
            }label: {
                Text("Guardar")
                    .frame(width: 100, alignment: .center)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(50)
            }
        }
    }
}

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 1, name: "User Test", username: "Username Test", email: "test@test.com", address: Address(street: "street", suite: "suite", city: "city", zipcode: "zip", geo: Geo(lat: "12.23", lng: "13.12")), phone: "000-000", website: "developer.apple.com", company: Company(name: "Apple", catchPhrase: "Apple", bs: "Apple BS"))
        DetailUserView(user: user)
    }
}
