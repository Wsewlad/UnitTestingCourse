//
//  SignupViewModel.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 11.05.2023.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    private var presenter: SignupPresenterProtocol
    
    init(presenter: SignupPresenterProtocol) {
        self.presenter = presenter
    }
    
    init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol
    ) {
        self.presenter = SignupPresenter(
            formModelValidator: SignupFormModelValidator(),
            webService: SignupWebService(urlString: ""),
            delegate: nil
        )
    }
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    
    @Published var error: AlertError? = nil
    @Published var isErrorPresented: Bool = false
    
    func signup() {
        self.presenter.delegate = self
        let model = SignupFormModel(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            repeatPassword: repeatPassword
        )
        
        presenter.processUserSignup(formModel: model)
    }
}

extension SignupViewModel: SignupViewDelegateProtocol {
    func successfulSignup() {
        // TODO
        print("successfulSignup")
    }
    
    func errorHandler(error: SignupError) {
        DispatchQueue.main.async {
            self.error = .init(text: "Your request could not be processed at this time")
            self.isErrorPresented = true
        }
    }
}
