//
//  SignUpViewModel.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import SwiftUI

class SignUpViewModel {
    
    private let tosNetworkManager: TosNetworkManager
    private let alertManager: AlertManager
    
    init(tosNetworkManager: TosNetworkManager, alertManager: AlertManager) {
        self.tosNetworkManager = tosNetworkManager
        self.alertManager = alertManager
    }
    
    func fetchTos() async throws -> String {
        alertManager.resetAlert()
        do {
            let tos = try await tosNetworkManager.fetchTos()
            return tos.tosText
        } catch {
            if let error = error as? CustomErrorProtocol {
                alertManager.setError(error: error)
            }
            throw TosNetworkError.badUrl
        }
    }
    
    func getAlert() -> UIAlertController {
        alertManager.getAlert()
    }
}
