//
//  LoginViewModel.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 01.05.2024.
//

import Foundation

class LoginViewModel {
    private let loginManager: LoginNetworkManager
    
    init(loginManager: LoginNetworkManager) {
        self.loginManager = loginManager
    }
    
    func login(email: String?, password: String?) async {
        guard let email = email, !email.isEmpty, email.isEmailAddressStructureValid() else {
            return
        }
        guard let password = password, !password.isEmpty, password.passwordStrength else {
            return
        }
        print("it goes throu")
        do {
            let user = try await loginManager.login(email: email, password: password)
            print(user)
        } catch {
            // TODO: validation errors
        }
    }
}
