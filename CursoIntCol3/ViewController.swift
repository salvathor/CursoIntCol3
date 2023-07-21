//
//  ViewController.swift
//  CursoIntCol3
//
//  Created by Salvador Lopez on 19/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerShareBtn: UIView!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*let myView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        myView.backgroundColor = .green
        self.view.addSubview(myView)
        let myBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        myBtn.backgroundColor = .darkGray
        myBtn.setTitle("OK", for: .normal)
        myView.addSubview(myBtn)
        myBtn.addTarget(self, action: #selector(doSomething), for: .touchUpInside)*/
        
        //MARK: XIBs
        let shareBtn = Bundle.main.loadNibNamed("ShareBtn", owner: self)?.first as? ShareBtn
        shareBtn?.frame = CGRect(x: 0, y: 0, width: 120, height: 35)
        shareBtn?.textShareBtn.text = "Compartir"
        containerShareBtn.addSubview(shareBtn!)
        //self.view.addSubview(shareBtn!)
        
    }

    /*@objc func doSomething(){
        print("Ancho: \(UIScreen.main.bounds.size.height)")
        print("Alto: \(UIScreen.main.bounds.size.height)")
        print("Origen: \(UIScreen.main.bounds.origin.x), \(UIScreen.main.bounds.origin.y)")
    }*/
    
    // MARK: Realizar o no segues
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        var performSegue = false
        
        if identifier != "segueLogin" {
            performSegue = true
        }else{
            //TODO: Evaluar credenciales
            if username.text == "root" && userpassword.text == "toor"{
                performSegue = true
            }
        }
        
        return performSegue
    }
    
    // MARK: Envio de informacion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcd = segue.destination as? VCLogin {
            // Envio de informacion al vcd.
            vcd.textMsg = "Hola desde VCO"
            //vcd.view.backgroundColor = .red
            var userOrigin = User(name: username.text!, pass: userpassword.text!)
            vcd.user = userOrigin
        }else if let vcr = segue.destination as? VCRegistro {
            vcr.delegate = self //(ViewController)
        }
    }
    
    // MARK: Segue o transicion por codigo
    @IBAction func goForgotPass(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vcForgotPassword = storyboard.instantiateViewController(withIdentifier: "idForgotPass") as? VCForgotPass{
            // Presentar VC de forma modal
            self.present(vcForgotPassword, animated: true)
            // Presentar VC en Navigation Controller
            //self.navigationController?.pushViewController(vcForgotPassword, animated: true)
            //self.show(vcForgotPassword, sender: self)
        }
    }
    
    // MARK: Forzar u omitir el shouldPerformSegue
    @IBAction func forzarSegue(_ sender: Any) {
        performSegue(withIdentifier: "segueLogin", sender: nil)
    }
    
}

extension ViewController: DataDelegateBack {
    
    func didReceiveDataBack(_ data: String) {
        print("Recibi el valor del VCRegistro: \(data)")
        self.username.text = data
    }
    
}
