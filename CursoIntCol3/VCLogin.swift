//
//  VCLogin.swift
//  CursoIntCol3
//
//  Created by Salvador Lopez on 19/07/23.
//

import UIKit

class VCLogin: UIViewController {

    @IBOutlet weak var msgLabel: UILabel!
    var textMsg = ""
    var user: User?
    
    @IBAction func salirAct(_ sender: Any) {
        self.dismiss(animated: true){
            print("Se cerro la session...")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        msgLabel.text = textMsg
        dump(user)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
