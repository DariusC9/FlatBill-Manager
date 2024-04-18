//
//  AlertManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 17.04.2024.
//

import UIKit

struct AlertManager {
    
    static func getAlert(error: CustomErrorProtocol) -> UIAlertController {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        return alert
    }
}
