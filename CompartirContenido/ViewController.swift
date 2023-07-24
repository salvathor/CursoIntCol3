//
//  ViewController.swift
//  CompartirContenido
//
//  Created by Salvador Lopez on 21/07/23.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    

    @IBAction func shareAction(_ sender: Any) {
        
        //MARK: UTI
        let txtFileURL = Bundle.main.url(forResource: "example", withExtension: "txt")!
        if let uti = getUTI(for: txtFileURL){
            print("Valor del archivo en formato UTI: \(uti)")
        }else{
            print("No se pudo obtener el UTI del archivo...")
        }
        
        //MARK: SIMPLE ACTIVITY CONTROLLER
        let img = UIImage(named: "logo")
        let activityController = UIActivityViewController(activityItems: ["Este es un texto a compartir",img!], applicationActivities: nil)
        self.present(activityController, animated: true)
    }
    
    
    @IBAction func shareAction2(_ sender: Any) {
        let activity2 = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        self.present(activity2, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getUTI(for fileURL: URL) -> String? {
        guard let fileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileURL.pathExtension as CFString, nil)?.takeRetainedValue() else {
            return nil
        }
        return fileUTI as String
    }

}

extension ViewController: UIActivityItemSource{
   
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "Este es un placeholder a compartir"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        var itemToShare: Any!
        if activityType == .message {
            itemToShare = "Solo me muestro en la app de #iMessage 💬"
        }else if activityType == .mail {
            itemToShare = "Solo me muestro en la app de #Mail ✉️"
        }else if activityType == .copyToPasteboard {
            itemToShare = "Texto a compartir - Copyright ©"
        }else{
            itemToShare = "Este es un valor por defecto a compartir"
        }
        return itemToShare
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return "#Aviso Importante"
    }
    
}
