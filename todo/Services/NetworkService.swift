//
//  NetworkService.swift
//  todo
//
//  Created by Manoli on 18/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    let baseURL = "http://localhost:3003"
    let addTodoURL = "/add"
    
    let session = URLSession(configuration: .default)
    
    func getTodos(onSuccess: @escaping (Todos) -> Void) {
        let url = URL(string: baseURL)!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    debugPrint("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let items = try JSONDecoder().decode(Todos.self, from: data)
                        onSuccess(items)
                    } else {
                        let error = try JSONDecoder().decode(APIError.self, from: data)
                        print(error)
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
    
    func addTodo(todo: Todo) {
        
    }
}
