//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 09.05.2023.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator {
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var arePasswordMatch: Bool = false
}

extension MockSignupModelValidator: SignupModelValidatorProtocol {
    func isFirstNameValid(_ value: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(_ value: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(_ value: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(_ value: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(_ value1: String, _ value2: String) -> Bool {
        arePasswordMatch = true
        return arePasswordMatch
    }
}
