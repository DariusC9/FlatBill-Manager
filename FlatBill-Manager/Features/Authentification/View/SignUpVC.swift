//
//  SignUpVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 27.02.2024.
//

import UIKit

class SignUpVC: UIViewController {
    
    let viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView = UIStackView()
    let usernameTextField = TextFieldView(title: "Username")
    let emailTextField = TextFieldView(title: "Email")
    let passwordTextField = TextFieldView(title: "Password", isSecureField: true)
    let confirmPasswordTextField = TextFieldView(title: "Confirm Password", isSecureField: true)
    let signUpButton = UIButton(type: .custom)
    let tosView = UIView()
    let tosLabel = UILabel()
    let tosButton = UIButton(type: .system)
    let privacyView = UIView()
    let privacyLabel = UILabel()
    let privacyButton = UIButton(type: .system)
    
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
        viewModel.delegate = self
        
        stackView.axis = .vertical
        stackView.distribution  = .fillEqually
        stackView.spacing = 8
        
        signUpButton.backgroundColor = UIColor.lightGray
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        signUpButton.isUserInteractionEnabled = false
        
        tosView.backgroundColor = .clear
        
        tosLabel.text = "By signing up, you agree to our"
        tosLabel.font = UIFont.systemFont(ofSize: 15) // to be changed
        tosLabel.textColor = UIColor.gray
        
        tosButton.setTitle("Terms of services", for: .normal)
        tosButton.setTitleColor(UIColor.appBlue, for: .normal)
        tosButton.addTarget(self, action: #selector(tosPressed), for: .touchUpInside)
        
        privacyView.backgroundColor = .clear
        
        privacyLabel.text = "and"
        privacyLabel.font = UIFont.systemFont(ofSize: 15) // to be changed
        privacyLabel.textColor = UIColor.gray
        
        privacyButton.setTitle("Privacy policy", for: .normal)
        privacyButton.setTitleColor(UIColor.appBlue, for: .normal)
        privacyButton.addTarget(self, action: #selector(tosPressed), for: .touchUpInside)
    }
    
    /// view constraints
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmPasswordTextField)
        view.addSubview(signUpButton)
        view.addSubview(tosView)
        tosView.addSubview(tosLabel)
        tosView.addSubview(tosButton)
        view.addSubview(privacyView)
        privacyView.addSubview(privacyLabel)
        privacyView.addSubview(privacyButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        tosView.translatesAutoresizingMaskIntoConstraints = false
        tosLabel.translatesAutoresizingMaskIntoConstraints = false
        tosButton.translatesAutoresizingMaskIntoConstraints = false
        privacyView.translatesAutoresizingMaskIntoConstraints = false
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        NSLayoutConstraint.activate([
            tosView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tosView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.size.height/8))
        ])
        NSLayoutConstraint.activate([
            tosLabel.topAnchor.constraint(equalTo: tosView.topAnchor),
            tosLabel.leadingAnchor.constraint(equalTo: tosView.leadingAnchor),
            tosLabel.bottomAnchor.constraint(equalTo: tosView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            tosButton.topAnchor.constraint(equalTo: tosView.topAnchor),
            tosButton.leadingAnchor.constraint(equalTo: tosLabel.trailingAnchor, constant: 4),
            tosButton.trailingAnchor.constraint(equalTo: tosView.trailingAnchor),
            tosButton.bottomAnchor.constraint(equalTo: tosView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            privacyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            privacyView.topAnchor.constraint(equalTo: tosView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            privacyLabel.topAnchor.constraint(equalTo: privacyView.topAnchor),
            privacyLabel.leadingAnchor.constraint(equalTo: privacyView.leadingAnchor),
            privacyLabel.bottomAnchor.constraint(equalTo: privacyView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            privacyButton.topAnchor.constraint(equalTo: privacyView.topAnchor),
            privacyButton.leadingAnchor.constraint(equalTo: privacyLabel.trailingAnchor, constant: 4),
            privacyButton.trailingAnchor.constraint(equalTo: privacyView.trailingAnchor),
            privacyButton.bottomAnchor.constraint(equalTo: privacyView.bottomAnchor)
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
    
    @objc func tosPressed(sender: UIButton!) {
        Task {
            let tos = await viewModel.fetchTos()
            if let tos, !tos.isEmpty {
                let vcDestination = TosVC(tosText: tos)
                present(UINavigationController(rootViewController: vcDestination), animated: true)
            }
        }
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

// MARK: - Actions

extension SignUpVC: SignUpDelegate {
    func showAlert(_ alertData: CustomErrorProtocol) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let alert = AlertManager.getAlert(error: alertData)
            self.present(alert, animated: true)
        }
    }
}
