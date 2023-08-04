//
//  ViewController.swift
//  KeyChainSB
//
//  Created by Salvador Lopez on 04/08/23.
//

import UIKit

struct Crendentials {
    var username: String
    var password: String
}

enum KeychainError: Error{
    case noPassword // No hay un valor asociado a la contraseña.
    case unexpectedPasswordData // Los datos de contraseña (attr) no son validos.
    case unhandledError(status: OSStatus) // Error en Keychain - OSStatus (Sistema operativo)
}

class ViewController: UIViewController {
    
    var credenciales = Crendentials(username: "salvador@gmail.com", password: "qwerty123")
    let server = "www.example.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveItem = UIButton(frame: CGRect(x: 15, y: 150, width: 120, height: 30))
        saveItem.setTitle("Guardar", for: .normal)
        saveItem.backgroundColor = .gray
        saveItem.addTarget(self, action: #selector(addItemBtn), for: .touchUpInside)
        self.view.addSubview(saveItem)
        
        let getItem = UIButton(frame: CGRect(x: 150, y: 150, width: 120, height: 30))
        getItem.setTitle("Consultar", for: .normal)
        getItem.backgroundColor = .gray
        getItem.addTarget(self, action: #selector(queryItemBtn), for: .touchUpInside)
        self.view.addSubview(getItem)
        
    }
    
    @objc func addItemBtn(){
        do{
            try addItem(crendenciales: self.credenciales, server: self.server)
        } catch let error as KeychainError {
            switch error {
            case .noPassword:
                print("No hay un valor asociado a la contraseña.")
            case .unexpectedPasswordData:
                print("Los datos de contraseña (attr) no son validos.")
            case .unhandledError(let status):
                print("Error en Keychain - OSStatus \(status)")
            }
        } catch{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func addItem(crendenciales: Crendentials, server: String) throws {
        
        let account = credenciales.username
        let password = crendenciales.password
        
        let query: [String:Any] = [
            kSecClass as String : kSecClassInternetPassword,
            kSecAttrAccount as String : account,
            kSecAttrServer as String : server,
            kSecValueData as String : password.data(using: .utf8)!,
            kSecReturnAttributes as String : true
        ]
        
        print(query)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        print("Elemento del keychain guardado de manera exitosa")
        
    }
    
    @objc func queryItemBtn(){
        do {
            try queryItem(server: self.server)
        }catch let error as KeychainError {
            switch error {
            case .noPassword:
                print("No hay un valor asociado a la contraseña.")
            case .unexpectedPasswordData:
                print("Los datos de contraseña (attr) no son validos.")
            case .unhandledError(let status):
                print("Error en Keychain - OSStatus \(status)")
            }
        }catch {
            print("Error desconocido: \(error.localizedDescription)")
        }
    }
    
    func queryItem(server: String) throws {
        
        let querySearch: [String:Any] = [
            kSecClass as String : kSecClassInternetPassword,
            kSecAttrServer as String : server,
            kSecMatchLimit as String : kSecMatchLimitOne,
            kSecReturnAttributes as String : true,
            kSecReturnData as String : true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(querySearch as CFDictionary, &item)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.noPassword
        }
        
        guard status == errSecSuccess else{
            throw KeychainError.unhandledError(status: status)
        }
        
        //Validation
        guard let existingItem = item as? [String:Any],
              let passwordData = existingItem[kSecValueData as String] as? Data,
              let password = String(data: passwordData, encoding: .utf8),
              let account = existingItem[kSecAttrAccount as String] as? String else {
            throw KeychainError.unexpectedPasswordData
        }
        
        let attributes = Crendentials(username: account, password: password)
        dump(attributes)
        
    }


}

