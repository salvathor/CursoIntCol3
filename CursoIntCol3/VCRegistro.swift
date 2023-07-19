//
//  VCRegistro.swift
//  CursoIntCol3
//
//  Created by Salvador Lopez on 19/07/23.
//

import UIKit

protocol DataDelegateBack: AnyObject{
    func didReceiveDataBack(_ data: String)
}

class VCRegistro: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    var delegate: DataDelegateBack?
    
    @IBAction func registerAction(_ sender: Any) {
        if usernameTextField.text != "" {
            let data = usernameTextField.text!
            delegate?.didReceiveDataBack(data)
            //self.dismiss(animated: true)
            //self.navigationController?.dismiss(animated: true)
            // TODO: CHECK DISMISS
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
