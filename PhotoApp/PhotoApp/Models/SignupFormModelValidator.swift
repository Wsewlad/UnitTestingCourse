//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 28.04.2023.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
}

//MARK: - First Name
extension SignupFormModelValidator {
    func isFirstNameValid(_ value: String) -> Bool {
        if value.count < SignupConstants.firstNameMinLength || value.count > SignupConstants.firstNameMaxLength {
            return false
        }
        return true
    }
}

//MARK: - Last Name
extension SignupFormModelValidator {
    func isLastNameValid(_ value: String) -> Bool {
        if value.count < SignupConstants.lastNameMinLength || value.count > SignupConstants.lastNameMaxLength {
            return false
        }
        return true
    }
}

//MARK: - Email
extension SignupFormModelValidator {
    func isEmailValid(_ value: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: value)
    }
}

//MARK: - Password
extension SignupFormModelValidator {
    func isPasswordValid(_ value: String) -> Bool {
        if value.count < SignupConstants.passwordMinLength || value.count > SignupConstants.passwordMaxLength {
            return false
        }
        return true
    }
}
