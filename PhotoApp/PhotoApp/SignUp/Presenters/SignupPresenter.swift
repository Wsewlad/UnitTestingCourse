//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 07.05.2023.
//

import Foundation

class SignupPresenter {
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    
    init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol
    ) {
        self.formModelValidator = formModelValidator
        self.webService = webService
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
        
        let requestModel = SignupFormRequestModel(
            firstName: formModel.firstName,
            lastName: formModel.lastName,
            email: formModel.email,
            password: formModel.password
        )
        
        self.webService.signup(withForm: requestModel) { responseModel, error in
            // TODO: -
        }
    }
}
