//
//  LoginVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 26.02.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    let emailTextField = TextFieldView(title: "Email")
    let passwordTextField = TextFieldView(title: "Password", isSecureField: true)
    let loginButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
        setupValidationForNotEmptyTextFields()
    }
    
    // MARK: - Private functions
    
    /// view style
    private func style() {
        view.backgroundColor = UIColor.white
        
        loginButton.backgroundColor = UIColor.lightGray
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.isUserInteractionEnabled = false
    }
    
    /// view constraints
    private func layout() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(view.frame.size.height/6))
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func setupValidationForNotEmptyTextFields() {
        emailTextField.textField.addTarget(self,
                                           action: #selector(textFieldsIsNotEmpty),
                                           for: .editingChanged)
        passwordTextField.textField.addTarget(self,
                                           action: #selector(textFieldsIsNotEmpty),
                                           for: .editingChanged)
    }
}

    // MARK: - Actions

extension LoginVC {
    
    @objc func loginPressed(sender: UIButton!) {
      print("login pressed")
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let email = emailTextField.textField.text, !email.isEmpty,
            let password = passwordTextField.textField.text, !password.isEmpty
        else
        {
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = UIColor.lightGray
            return
        }
        
        loginButton.isUserInteractionEnabled = true
        loginButton.backgroundColor = UIColor.appBlue
    }
}
