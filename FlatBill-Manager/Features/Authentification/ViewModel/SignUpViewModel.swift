//
//  SignUpViewModel.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import Foundation

class SignUpViewModel {
    
    private let tosNetworkManager: TosNetworkManager
    
    init(tosNetworkManager: TosNetworkManager) {
        self.tosNetworkManager = tosNetworkManager
    }
    
    func fetchTos() async -> String? {
        do {
            let tos = try await tosNetworkManager.fetchTos()
            return tos.tosText
        } catch {
            return nil
        }
    }
}
