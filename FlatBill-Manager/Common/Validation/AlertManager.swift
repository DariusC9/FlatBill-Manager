//
//  AlertManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 17.04.2024.
//

import UIKit

class AlertManager {
    
    private var error: CustomErrorProtocol?
    
    func setError(error: CustomErrorProtocol) {
        self.error = error
    }
    
    func getAlert() -> UIAlertController {
        let alert = UIAlertController(title: error?.title, message: error?.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        return alert
    }
    
    func resetAlert() {
        error = nil
    }
}
