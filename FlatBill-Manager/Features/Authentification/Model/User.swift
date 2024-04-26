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
    let password: String
    
    init(email: String, password: String) {
        id = nil
        name = email
        self.password = password
    }
}
