//
//  PrivacyVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 18.04.2024.
//

import UIKit

class PrivacyVC: UIViewController {
    
    let privacyLabel = UILabel()
    
    init(privacyText: String) {
        privacyLabel.text = privacyText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = UIColor.white
        self.title = "Privacy policy"
        
        privacyLabel.font = .systemFont(ofSize: 20)
        privacyLabel.textColor = .black
        privacyLabel.numberOfLines = 0
    }
    
    private func layout() {
        view.addSubview(privacyLabel)
        
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            privacyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
