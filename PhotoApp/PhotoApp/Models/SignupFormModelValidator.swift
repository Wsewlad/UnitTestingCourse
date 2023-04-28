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
