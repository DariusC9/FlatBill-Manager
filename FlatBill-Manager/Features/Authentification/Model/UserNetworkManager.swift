//
//  UserNetworkManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 26.04.2024.
//

import Foundation

struct UserNetworkManager {
    let url: URL? = URL(string: ApiKeys.signUp)
    
    func signUp(email: String, password: String) async throws {
        guard let url else {
            throw TosNetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let user = User(email: email, password: password)
        
        let encoded = try JSONEncoder().encode(user)
        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        // TODO: handle response
    }
}
