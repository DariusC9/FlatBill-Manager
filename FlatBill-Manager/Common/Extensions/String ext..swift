//
//  String ext..swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 29.04.2024.
//

import Foundation

extension String {

    // MARK: Password Checking

    var passwordStrength: Bool {

        guard !self.containsWhiteSpaces() else { return false }

        let passwordLength = self.count

        if passwordLength < 6 {
            return false
        } else if !self.containsNumbers() && !self.containsSymbols() {
            return false
        }

        return true
    }

    // Check for white spaces
    func containsWhiteSpaces() -> Bool {
        let regexForCheckingWhiteSpaces = ".*\\s.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexForCheckingWhiteSpaces)
        return predicate.evaluate(with: self)
    }

    // Check if the input string contains any numbers
    func containsNumbers() -> Bool {
        let regexForCheckingNumbers = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexForCheckingNumbers)
        return predicate.evaluate(with: self)
    }

    // Check if the input string contains any special characters
    func containsSymbols() -> Bool {
        let regexForCheckingSymbols = ".*[^a-zA-Z0-9\\s]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexForCheckingSymbols)
        return predicate.evaluate(with: self)
    }

    // MARK: Email Checking

    // Check if the input matched the structure of a real email address. Example: xxxxx@xxxx.xxx (valid) xxxx.xx (not valid)
    func isEmailAddressStructureValid() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
}

