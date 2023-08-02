//
//  ViewController.swift
//  CLStoryboard
//
//  Created by Salvador Lopez on 31/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    var statusLabel: UILabel!
    var screen = UIScreen.main.bounds
    
    var locationService = LocationServices()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        initLocationService()
    }
    
    func setupUI(){
        statusLabel = UILabel(
            frame: CGRect(
                x: (self.screen.width / 2) - 200 ,
                y: self.screen.height/2,
                width: 400,
                height: 50)
        )
        statusLabel.font = .systemFont(ofSize: 20)
        statusLabel.textAlignment = .center
        statusLabel.text = "Service Location..."
        statusLabel.numberOfLines = 0
        self.view.addSubview(statusLabel)
    }
    
    func initLocationService(){
        locationService.delegate = self
        // Validar si tengo permisos
        let isEnable = locationService.enable
        if isEnable {
            locationService.requestAuthorization()
        }else{
            // mostrar mensaje servicios ubicacion
            locationServicesNeedState()
        }
    }


}

extension ViewController: LocationServicesDelegate {
    func authorizationRestricted() {
        locationServicesRestrictedState()
    }
    
    func authorizationUnknow() {
        locationServicesNeedState()
    }
    
    func promptAuthorizationAction() {
        locationServicesLaunchPrompt()
    }
    
    func didAuthorized() {
        locationService.start()
    }
}

// MARK: Update UI.
extension ViewController {
    
    func locationServicesRestrictedState(){
        self.statusLabel.text = "El acceso a los servicios de ubicacion son necesarios para la app."
    }
    
    func locationServicesNeedState(){
        self.statusLabel.text = "Esta app esta restringida de los servicios de ubicación."
    }
    
    func locationServicesLaunchPrompt(){
        let alert = UIAlertController(title: "Permisos de ubicación", message: "Por favor acepte los permisos de ubicación para brindar una mejor experiencia.", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Ir a configuración", style: .default){
            _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel){
            _ in
            self.locationServicesNeedState()
        }
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
}
