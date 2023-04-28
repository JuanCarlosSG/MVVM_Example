//
//  ExampleViewModel.swift
//  MVVM Example
//
//  Created by Juan Carlos on 30/03/23.
//

import Foundation
import SwiftUI

class ExampleViewModel : ObservableObject {
    
    @Published var todos = [TODO]()
    
    var nulo : String!
    
    func getTodos() {
        
        // JSON Placeholder TODO Api
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {fatalError()}
        
        // URL Request ( GET by default )
        let urlRequest = URLRequest(url: url)
        
        // URL HTTP Request execution
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, resp, err in
            
            // Optional Binding (Innerscope)
            if let error = err {
                print("Error took place in \(error.localizedDescription)")
                return
            }
            
            // Optional Binding (Outerscope)
            guard let data = data else {
                print("Service did not return data")
                return
            }
            
            do {
                
                let todoResponse = try JSONDecoder().decode(TODO_Response.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    self!.todos = todoResponse
                }
                
            } catch {
                
                print("Error while decoding")
                
            }
            
        }
        
        dataTask.resume()
        
    }
    
}
