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
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol,
        delegate: SignupViewDelegateProtocol
    ) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
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
        
        self.webService.signup(withForm: requestModel) { [weak self] (responseModel, error) in
            
            if let _ = responseModel {
                self?.delegate?.successfulSignup()
                return
            }
        }
    }
}
