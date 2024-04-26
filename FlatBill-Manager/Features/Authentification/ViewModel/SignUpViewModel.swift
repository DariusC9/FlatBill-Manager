//
//  SignUpViewModel.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import SwiftUI

protocol SignUpDelegate: AnyObject {
    func showAlert(_ alertData: CustomErrorProtocol)
}

class SignUpViewModel {
    
    private let tosNetworkManager: TosNetworkManager
    private let privacyNetworkManager: PrivacyNetwork
    private let userManager: UserNetworkManager
    private let alertManager: AlertManager
    
    weak var delegate: SignUpDelegate?
    
    init(tosNetworkManager: TosNetworkManager, privacyNetworkManager: PrivacyNetwork, userManager: UserNetworkManager, alertManager: AlertManager) {
        self.tosNetworkManager = tosNetworkManager
        self.privacyNetworkManager = privacyNetworkManager
        self.userManager = userManager
        self.alertManager = alertManager
    }
    
    func signUp(username: String?, email: String?, password: String?, confPassword: String?) async {
        guard let username = username, !username.isEmpty else {
            return
        }
        guard let email = email, !email.isEmpty else {
            return
        }
        guard let password = password, !password.isEmpty else {
            return
        }
        guard let confPassword = confPassword, !confPassword.isEmpty else {
            return
        }
        
        do {
            try await userManager.signUp(email: email, password: password)
        } catch {
            // TODO: validation errors
        }
    }
    
    func fetchTos() async -> String? {
        do {
            let tos = try await tosNetworkManager.fetchTos()
            return tos.tosText
        } catch {
            if let error = error as? CustomErrorProtocol {
                delegate?.showAlert(error)
            } else {
                delegate?.showAlert(TosNetworkError.general)
            }
        }
        return nil
    }
    
    func fetchPrivacy() async -> String? {
        do {
            let privacy = try await privacyNetworkManager.fetchTos()
            return privacy.privacyText
        } catch {
            if let error = error as? CustomErrorProtocol {
                delegate?.showAlert(error)
            } else {
                delegate?.showAlert(TosNetworkError.general)
            }
        }
        return nil
    }
}
