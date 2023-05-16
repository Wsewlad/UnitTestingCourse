//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 11.05.2023.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var delegate: PhotoApp.SignupViewDelegateProtocol?
    var processUserSignupCalled = false
    
    required init(
        formModelValidator: PhotoApp.SignupModelValidatorProtocol,
        webService: PhotoApp.SignupWebServiceProtocol,
        delegate: PhotoApp.SignupViewDelegateProtocol?
    ) {
        // TODO
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
