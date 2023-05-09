//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 07.05.2023.
//

import Foundation

class SignupPresenter {
    private var formModelValidator: SignupModelValidatorProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(formModel.firstName) {
            return
        }
        if !formModelValidator.isLastNameValid(formModel.lastName) {
            return
        }
        if !formModelValidator.isEmailValid(formModel.email) {
            return
        }
        if !formModelValidator.isPasswordValid(formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(formModel.password, formModel.repeatPassword) {
            return
        }
    }
}
