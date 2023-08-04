//
//  ViewController.swift
//  CoreDataSB
//
//  Created by Salvador Lopez on 02/08/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var users = [User]()
    var idSelected: UUID?
    
    // Instancia de AppDelegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveUser(_ sender: Any) {
        // Obtener el contexto
        let manageContext = self.appDelegate.persistentContainer.viewContext
        
        // Nueva Entidad
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: manageContext)
        
        // Crear registro
        let user = NSManagedObject(entity: userEntity!, insertInto: manageContext)
        user.setValue(UUID(), forKey: "id")
        user.setValue(userNameTextField.text, forKey: "username")
        user.setValue(emailTextField.text, forKey: "email")
        user.setValue(passwordTextField.text, forKey: "password")
        
        do{
            try manageContext.save()
            print("Guardado con exito!")
            loadUsers()
        }catch{
            print("Error: \(error)")
        }
        
    }
    
    @IBAction func updateUser(_ sender: Any) {
        // Obtener el context
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // Request + Predicate
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "id == %@", idSelected! as CVarArg)
        
        // Fetch
        do{
            let records = try manageContext.fetch(fetchRequest)
            if let firstResult = records.first as? NSManagedObject{
                firstResult.setValue(self.userNameTextField.text, forKey: "username")
                firstResult.setValue(self.emailTextField.text, forKey: "email")
                firstResult.setValue(self.passwordTextField.text, forKey: "password")
                //Save
                do{
                    try manageContext.save()
                    print("Se aplicaron los cambios")
                    loadUsers()
                }
            }
        }catch{
            print("Error: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.loadUsers()
    }
    
    func loadUsers(){
        // Obtener contexto
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // Fetch
        do{
            let result = try manageContext.fetch(fetchRequest)
            print("Results: \(result.count)")
            if result.isEmpty{
                print("No hay registros")
            }else{
                self.users.removeAll()
                result.forEach { user in
                    if let user = user as? User{
                        self.users.append(user)
                        //print(user.id)
                        //print(user.email)
                        //print(user.username)
                        //print(user.password)
                        //print("-------------")
                    }
                }
                clearTextFields()
                tableView.reloadData()
            }
        }catch{
            print("Error: \(error)")
        }
    }
    
    func deleteUser(_ idUserToDelete: UUID){
        // Obtener Context
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "id == %@", idUserToDelete as CVarArg)
        
        // Delete
        do{
            let records = try manageContext.fetch(fetchRequest)
            if let firstRecord = records.first as? NSManagedObject{
                manageContext.delete(firstRecord)
                try manageContext.save()
                print("Eliminado...")
                loadUsers()
            }
        }catch{
            print("Error: \(error)")
        }
    }
    
    func clearTextFields(){
        self.userNameTextField.text = ""
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.userNameLbCell.text = users[indexPath.row].username
        cell.emailUserLbCell.text = users[indexPath.row].email
        cell.imgUserCell.image = UIImage(systemName: "person.crop.circle")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Core Data (Users)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.userNameTextField.text  = users[indexPath.row].username
        self.emailTextField.text = users[indexPath.row].email
        self.passwordTextField.text = users[indexPath.row].password
        self.idSelected = users[indexPath.row].id
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteUser(users[indexPath.row].id!)
        }
    }
    
}

