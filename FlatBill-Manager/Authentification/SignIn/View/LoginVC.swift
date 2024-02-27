//
//  LoginVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 26.02.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    let emailTextField = TextFieldView(title: "Email")

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    // MARK: - Private functions
    
    /// view style
    private func style() {
        view.backgroundColor = UIColor.white
    }
    
    /// view constraints
    private func layout() {
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
