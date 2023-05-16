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
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    
    func signup() {
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

//extension SignupViewModel: SignupViewDelegateProtocol {
//    func successfulSignup() {
//        // TODO
//    }
//    
//    func errorHandler(error: SignupError) {
//        // TODO
//    }
//}
