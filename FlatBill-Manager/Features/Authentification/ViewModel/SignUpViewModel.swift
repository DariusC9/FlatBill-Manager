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
    private let alertManager: AlertManager
    
    weak var delegate: SignUpDelegate?
    
    init(tosNetworkManager: TosNetworkManager, alertManager: AlertManager) {
        self.tosNetworkManager = tosNetworkManager
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
}
