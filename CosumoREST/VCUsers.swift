//
//  VCUsers.swift
//  CosumoREST
//
//  Created by Salvador Lopez on 26/07/23.
//

import UIKit

class VCUsers: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var urlService = "https://jsonplaceholder.typicode.com/users"
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var request = URLRequest(url: URL(string: urlService)!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            if error != nil {
                print("Error: \(error)")
            }else{
                do{
                    let arrUsers = try JSONDecoder().decode([User].self, from: data!)
                    //print("Numero de usuarios: \(arrUsers.count)")
                    //arrUsers.forEach { user in
                        //print("Nombre: \(user.name)")
                    //}
                    //print("Detalle de usuarios:")
                    //dump(arrUsers)
                    self.users = arrUsers
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch{
                    print("Error: \(error)")
                }
            }
        }.resume()
    }

}

extension VCUsers: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUser", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dump(users[indexPath.row])
    }
    
}
