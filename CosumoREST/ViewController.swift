//
//  ViewController.swift
//  CosumoREST
//
//  Created by Salvador Lopez on 24/07/23.
//

import UIKit

//MARK: PropertyList for Networking https://developer.apple.com/documentation/bundleresources/information_property_list/nsapptransportsecurity/nsexceptiondomains

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var textMessageLb: UILabel!
    
    var urlService = "https://netecswift-salvatoreisc.b4a.run"
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let user = self.userTextField.text else {
            textMessageLb.text = "Debes ingresar un nombre de usuario."
            return
        }
        
        guard let pass = self.passwordTextField.text else {
            textMessageLb.text = "Debes ingresar un password."
            return
        }
        
        //MARK: URLRequest
        var request = URLRequest(url: URL(string: "\(urlService)/login.php?user=\(user)&pass=\(pass)")!)
        request.httpMethod = "GET"
        //MARK: URLSession
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            if error != nil {
                print("Error: \(error)")
            }
            print("\t --> RESPONSE: ")
            print(response)
            print("\t --> DATA: ")
            print(data!)
            print(String(data: data!, encoding: .utf8))
            do{
                let jsonObjResult = try JSONSerialization.jsonObject(with: data!) as! [String:AnyObject]
                if let status = jsonObjResult["status"]{
                    if (status as? String) == "ok" {
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "loginOk", sender: nil)
                        }
                    }
                }
                if let message = jsonObjResult["message"]{
                    DispatchQueue.main.async {
                        self.textMessageLb.text = "\(message as! String)"
                    }
                }
            }catch{
                print("Error: \(error)")
            }
        }
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }

}

