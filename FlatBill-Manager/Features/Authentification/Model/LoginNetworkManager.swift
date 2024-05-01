//
//  LoginNetworkManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 01.05.2024.
//

import Foundation

struct LoginNetworkManager {
    let url: URL? = URL(string: ApiKeys.login)
    
    func login(email: String, password: String) async throws -> User {
        guard let url else {
            throw TosNetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let user = User(name: "", email: email, password: password)
        
        let encoded = try JSONEncoder().encode(user)
        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200 <= httpResponse.statusCode && httpResponse.statusCode <= 300 {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    print(user)
                    return user
                } catch {
                    throw TosNetworkError.general
                }
            }
            if httpResponse.statusCode == 400 {
                do {
                    let error = try JSONDecoder().decode(ErrorServer.self, from: data)
                    print("=================")
                    print("\(error)")
                    print("=================")
                } catch {
                    throw TosNetworkError.general
                }
            }
        }
        throw TosNetworkError.general
    }
}
