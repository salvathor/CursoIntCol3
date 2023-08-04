//
//  ViewController.swift
//  UserDefaultsSB
//
//  Created by Salvador Lopez on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var slider = UISlider()
    var label = UILabel()
    let screenBounds = UIScreen.main.bounds
    
    var preferredVolume: Int = 0 {
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Ejemplo 1VC
        //saveDataUserDefault()
        //getDataUserDefault()
        
        //MARK: Ejemplo 2VC
        setupUI()
        preferredVolume = UserDefaults.standard.integer(forKey: "PreferredVolume")
    }
    
}

// MARK: Ejemplo 1
extension ViewController {
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

// MARK: Ejemplo 2
extension ViewController {
    
    func setupUI(){
        
        //MARK: LABEL
        label.frame = CGRect(x: 15, y: 50, width: 120, height: 30)
        label.textColor = .blue
        self.view.addSubview(label)
        
        //MARK: SLIDER
        slider.frame = CGRect(x: 15, y: 100, width: screenBounds.width/2, height: 15)
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(updateSlider(sender:)), for: .valueChanged)
        self.view.addSubview(slider)
        
        //MARK: BUTTON
        let saveBtn = UIButton(frame: CGRect(x: 15, y: 150, width: 120, height: 30))
        saveBtn.setTitle("Save Volume", for: .normal)
        saveBtn.backgroundColor = .blue
        saveBtn.addTarget(self, action: #selector(saveVolume), for: .touchUpInside)
        self.view.addSubview(saveBtn)
    }
    
    func updateUI(){
        label.text = "\(preferredVolume)"
        slider.value = Float(preferredVolume)
    }
    
    @objc func updateSlider(sender: UISlider){
        preferredVolume = Int(sender.value)
    }
    
    @objc func saveVolume(){
        UserDefaults.standard.set(preferredVolume, forKey: "PreferredVolume")
        print("Save it!")
    }
    
}

