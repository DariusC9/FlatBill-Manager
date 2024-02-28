//
//  SignUpVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 27.02.2024.
//

import UIKit

class SignUpVC: UIViewController {
    
    let stackView = UIStackView()
    let usernameTextField = TextFieldView(title: "Username")
    let emailTextField = TextFieldView(title: "Email")
    let passwordTextField = TextFieldView(title: "Password", isSecureField: true)
    let confirmPasswordTextField = TextFieldView(title: "Confirm Password", isSecureField: true)
    let signUpButton = UIButton(type: .custom)
    
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
        self.title = "Create account"
        
        stackView.axis = .vertical
        stackView.distribution  = .fillEqually
        stackView.spacing = 8
        
        signUpButton.backgroundColor = UIColor.lightGray
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        signUpButton.isUserInteractionEnabled = false
    }
    
    /// view constraints
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmPasswordTextField)
        view.addSubview(signUpButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signUpButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func setupValidationForNotEmptyTextFields() {
        usernameTextField.textField.addTarget(self,
                                           action: #selector(textFieldsIsNotEmpty),
                                           for: .editingChanged)
        emailTextField.textField.addTarget(self,
                                           action: #selector(textFieldsIsNotEmpty),
                                           for: .editingChanged)
        passwordTextField.textField.addTarget(self,
                                              action: #selector(textFieldsIsNotEmpty),
                                              for: .editingChanged)
        confirmPasswordTextField.textField.addTarget(self,
                                           action: #selector(textFieldsIsNotEmpty),
                                           for: .editingChanged)
    }
}

// MARK: - Actions

extension SignUpVC {
    
    @objc func signUpPressed(sender: UIButton!) {
        print("sign up pressed")
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let userName = usernameTextField.textField.text, !userName.isEmpty,
            let email = emailTextField.textField.text, !email.isEmpty,
            let password = passwordTextField.textField.text, !password.isEmpty,
            let confirmedPassword = confirmPasswordTextField.textField.text, !confirmedPassword.isEmpty
        else
        {
            signUpButton.isUserInteractionEnabled = false
            signUpButton.backgroundColor = UIColor.lightGray
            return
        }
        
        signUpButton.isUserInteractionEnabled = true
        signUpButton.backgroundColor = UIColor.appBlue
    }
}
