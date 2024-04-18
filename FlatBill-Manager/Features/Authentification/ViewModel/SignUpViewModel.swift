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
    private let alertManager: AlertManager
    
    weak var delegate: SignUpDelegate?
    
    init(tosNetworkManager: TosNetworkManager, privacyNetworkManager: PrivacyNetwork, alertManager: AlertManager) {
        self.tosNetworkManager = tosNetworkManager
        self.privacyNetworkManager = privacyNetworkManager
        self.alertManager = alertManager
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
