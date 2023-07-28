//
//  DataManager.swift
//  SwiftUIConsumoREST
//
//  Created by Salvador Lopez on 28/07/23.
//

import Foundation

func getData(_ url: String, completion: @escaping ([User]) -> Void) {
    
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request){
        data, response, error in
        
        if let error = error{
            print("Error: \(error)")
        }else{
            //TODO: Validar el response...
            do{
                let fetchedResult = try JSONDecoder().decode([User].self, from: data!)
                completion(fetchedResult)
            }catch{
                print("Error: \(error)")
            }
        }
    
    }
    task.resume()
    
}
