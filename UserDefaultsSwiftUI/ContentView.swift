//
//  ContentView.swift
//  UserDefaultsSwiftUI
//
//  Created by Salvador Lopez on 02/08/23.
//

import SwiftUI

struct Show: Codable {
    let id: Int
    let name: String
    let time: String
}

struct ContentView: View {
    
    @State private var show: Show? = nil
    
    var body: some View {
        VStack {
            Button("Save show UserDefaults"){
                let showTV = Show(id: 2, name: "The Simpson", time: "8:10pm")
                do{
                    let data = try JSONEncoder().encode(showTV)
                    UserDefaults.standard.set(data, forKey: "ShowTV")
                    print("Show TV saved to UserDefaults...")
                }catch{
                    print("Error: \(error)")
                }
            }
            Button("Load show from UserDefauls"){
                if let data = UserDefaults.standard.data(forKey: "ShowTV"){
                    do{
                        let showTv = try JSONDecoder().decode(Show.self, from: data)
                        self.show = showTv
                    }catch{
                        print("Error: \(error)")
                    }
                } else {
                    print("no se han encontrado datos en el user defaults.")
                }
            }
            
            if let show = show {
                VStack{
                    Text("Show Details")
                        .font(.title)
                        .padding()
                    Text("Nombre: \(show.name)")
                        .font(.title2)
                    Text("Hora: \(show.time)")
                        .font(.title2)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
