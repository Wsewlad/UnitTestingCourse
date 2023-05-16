//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 07.05.2023.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    weak var delegate: SignupViewDelegateProtocol?
    
    required init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol,
        delegate: SignupViewDelegateProtocol?
    ) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(formModel.firstName) {
            self.delegate?.errorHandler(error: .signupFailed)
            return
        }
        if !formModelValidator.isLastNameValid(formModel.lastName) {
            self.delegate?.errorHandler(error: .signupFailed)
            return
        }
        if !formModelValidator.isEmailValid(formModel.email) {
            self.delegate?.errorHandler(error: .signupFailed)
            return
        }
        if !formModelValidator.isPasswordValid(formModel.password) {
            self.delegate?.errorHandler(error: .signupFailed)
            return
        }
        if !formModelValidator.doPasswordsMatch(formModel.password, formModel.repeatPassword) {
            self.delegate?.errorHandler(error: .signupFailed)
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
            
            self?.delegate?.errorHandler(error: .signupFailed)
        }
    }
}
