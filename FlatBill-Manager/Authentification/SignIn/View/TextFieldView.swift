//
//  TextFieldView.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 26.02.2024.
//

import UIKit

class TextFieldView: UIView {
    
    let subTitleLabel = UILabel()
    let textField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
        layout()
    }
    
    convenience init(title: String, frame: CGRect = .zero) {
        self.init(frame: frame)
        subTitleLabel.text = title
    }
    
    // MARK: - Private functions
    
    /// view style
    private func style() {
        self.backgroundColor = .clear

        subTitleLabel.font = UIFont.systemFont(ofSize: 18) // to be changed
        subTitleLabel.textColor = UIColor.black

        textField.borderStyle = UITextField.BorderStyle.none
        textField.placeholder = "Enter your email"
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.gray
        textField.layer.cornerRadius = 20.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        ///create padding for the textfield text
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 40))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    /// view constraints
    private func layout() {
        self.addSubview(subTitleLabel)
        self.addSubview(textField)

        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
