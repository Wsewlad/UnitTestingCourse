//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 28.04.2023.
//

import Foundation

class SignupFormModelValidator {
    
}

//MARK: - First Name
extension SignupFormModelValidator {
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
}

//MARK: - Last Name
extension SignupFormModelValidator {
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
}
