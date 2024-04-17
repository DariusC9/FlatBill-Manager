//
//  TosVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 17.04.2024.
//

import UIKit

class TosVC: UIViewController {
    
    let tosLabel = UILabel()
    
    init(tosText: String) {
        tosLabel.text = tosText
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
        self.title = "Terms of service"
        
        tosLabel.font = .systemFont(ofSize: 20) 
        tosLabel.textColor = .black
        tosLabel.numberOfLines = 0
    }
    
    private func layout() {
        view.addSubview(tosLabel)
        
        tosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tosLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            tosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tosLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
