//
//  NetworkManager.swift
//  PizzaApp
//
//  Created by Mac on 6/29/23.
//

import Foundation

protocol Endpoint {
    //HTTP
    var scheme: String {get}
    
    //base url
    var baseUrl: String {get}
    
    //url path
    var path: String {get}
    
    //parametes
    var parametres: [URLQueryItem] {get}
    
    //request method
    var method: String {get}
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    let baseUrl = "https://649cfb339bac4a8e669d2398.mockapi.io/api/v1/comboitems"
    
    func requestData(completion: @escaping (Result<[String], Error>) -> Void) {
        
        guard let url = URL(string: baseUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            do {
                let receivedData = try decoder.decode([String].self, from: data)
                completion(.success(receivedData))
            } catch {
                print("Something went wrong")
            }
        }
        task.resume()
    }
    
    func requestDataFromServer(name: String, completion: @escaping (Result<[PizzaModel2], Error>) -> Void) {
        
        let pizzaUrl = "https://649cfb339bac4a8e669d2398.mockapi.io/api/v1/pizaitems"
        
        
        guard let url = URL(string: pizzaUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            
            do {
                let receivedData = try decoder.decode([PizzaModel2].self, from: data)
                completion(.success(receivedData))
            } catch {
                print("Something went wrong")
            }
        }
        task.resume()
    }
    
    func requestDataFromServerCombo(name: String, completion: @escaping (Result<[PizzaModel2], Error>) -> Void) {
        
        let pizzaUrl = "https://64a0f84b0079ce56e2dab651.mockapi.io/api/v2/\(name)"
        
        
        guard let url = URL(string: pizzaUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            
            do {
                let receivedData = try decoder.decode([PizzaModel2].self, from: data)
                completion(.success(receivedData))
            } catch {
                print("Something went wrong")
            }
        }
        task.resume()
    }
}
