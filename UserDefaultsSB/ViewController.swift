//
//  ViewController.swift
//  UserDefaultsSB
//
//  Created by Salvador Lopez on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveDataUserDefault()
        getDataUserDefault()
    }
    
    func saveDataUserDefault(){
        let showTV = Show(id: 1, name: "The Simpson", time: "8:00pm")
        do{
            let data = try JSONEncoder().encode(showTV)
            UserDefaults.standard.set(data, forKey: "ShowTV")
            print("Save it!")
        }catch{
            print("Error: \(error)")
        }
    }
    
    func getDataUserDefault(){
        if let data = UserDefaults.standard.data(forKey: "ShowTV"){
            do{
                let showtv = try JSONDecoder().decode(Show.self, from: data)
                dump(showtv)
            }catch{
                print("Error: \(error)")
            }
        }else{
            print("No se ha encontrado un valor almacenado")
        }
    }

}

class Show: Codable{
    var id: Int
    var name: String
    var time: String
    
    init(id:Int, name: String, time: String){
        self.id = id
        self.name = name
        self.time = time
    }
}

