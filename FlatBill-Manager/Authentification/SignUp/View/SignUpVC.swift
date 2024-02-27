//
//  SignUpVC.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 27.02.2024.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
    }
    
    // MARK: - Private functions
    
    private func style() {
        view.backgroundColor = UIColor.white
        self.title = "Create account"
    }
}
