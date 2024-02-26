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
    
    // MARK: - Private functions
    
    /// view style
    private func style() {
        self.backgroundColor = .clear

        subTitleLabel.text = "Email"
        subTitleLabel.font = UIFont.systemFont(ofSize: 18) // to be changed
        subTitleLabel.textColor = UIColor.black

        textField.borderStyle = UITextField.BorderStyle.none
        textField.placeholder = "Enter your email"
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
    }
    
    /// view constraints
    private func layout() {
        self.addSubview(subTitleLabel)
        self.addSubview(textField)

        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
        ])
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
