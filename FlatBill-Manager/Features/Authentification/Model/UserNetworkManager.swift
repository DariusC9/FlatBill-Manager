//
//  UserNetworkManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 26.04.2024.
//

import Foundation

struct UserNetworkManager {
    let url: URL? = URL(string: ApiKeys.signUp)
    
    func signUp(name: String, email: String, password: String) async throws {
        guard let url else {
            throw TosNetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let user = User(name: name, email: email, password: password)
        
        let encoded = try JSONEncoder().encode(user)
        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 400 {
                do {
                    let error = try JSONDecoder().decode(ErrorServer.self, from: data)
                    print("=================")
                    print("\(error)")
                    print("=================")
                } catch {
                    print("another error")
                }
            }
        }
    }
}
