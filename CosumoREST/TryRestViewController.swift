//
//  TryRestViewController.swift
//  CosumoREST
//
//  Created by Salvador Lopez on 28/07/23.
//

import UIKit

class TryRestViewController: UIViewController {
    
    var urlService = "https://jsonplaceholder.typicode.com/users"
    var urlService500 = "http://httpstat.us/503"

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: urlService500)
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: url!)
        task.resume()
    }


}

extension TryRestViewController: URLSessionDataDelegate{
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        do{
            let users = try JSONDecoder().decode([User].self, from: data)
            print(users)
        }catch{
            print("Error al decodificar los datos: \(error)")
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let httpResponse = task.response as? HTTPURLResponse {
            if (500...599).contains(httpResponse.statusCode){
                print("Ocurrio un error en el servidor.")
                print("Codigo de respuesta: \(httpResponse.statusCode)")
                // Reintentar la tarea
                let retryCount = task.currentRetryCount ?? 0
                retryDataTask(task as! URLSessionDataTask, retryCount: retryCount)
            }
        }
    }
    
    func retryDataTask(_ task: URLSessionDataTask, retryCount: Int) {
        let maxRetryCount = 3
        if retryCount < maxRetryCount {
            print("Intento: \(retryCount)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                let newTask = URLSession.shared.dataTask(with: task.originalRequest!) { [weak self]
                    data, response, error in
                    task.currentRetryCount = retryCount + 1
                    self?.retryDataTask(task, retryCount: retryCount + 1)
                }
                newTask.currentRetryCount = retryCount + 1
                newTask.resume()
            }
        }else{
            print("Se ha alcanzado el numero maximo de intentos")
        }
        
    }
    
}

private var currentRetryCountKey: Int8 = 0

extension URLSessionTask {
    var currentRetryCount: Int? {
        get {
            return objc_getAssociatedObject(self, &currentRetryCountKey) as? Int
        }
        set {
            objc_setAssociatedObject(self, &currentRetryCountKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
