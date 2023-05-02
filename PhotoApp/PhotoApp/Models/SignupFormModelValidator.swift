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
        var returnValue = true
        if value.count < SignupConstants.firstNameMinLength || value.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
}

//MARK: - Last Name
extension SignupFormModelValidator {
    func isLastNameValid(_ value: String) -> Bool {
        var returnValue = true
        if value.count < SignupConstants.lastNameMinLength || value.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
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
