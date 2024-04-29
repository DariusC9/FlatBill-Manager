//
//  User.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 26.04.2024.
//

import Foundation

struct User: Codable {
    let id: UUID?
    let name: String
    let email: String
    let password: String
    
    init(name: String, email: String, password: String) {
        id = nil
        self.name = name
        self.email = email
        self.password = password
    }
}
