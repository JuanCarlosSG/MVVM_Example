//
//  TODO.swift
//  MVVM Example
//
//  Created by Juan Carlos on 30/03/23.
//

import Foundation

struct TODO : Codable, Identifiable {
    
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
    
}

typealias TODO_Response = [TODO]
