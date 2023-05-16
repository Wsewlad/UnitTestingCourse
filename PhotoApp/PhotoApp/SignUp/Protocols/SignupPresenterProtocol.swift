//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 11.05.2023.
//

import Foundation

protocol SignupPresenterProtocol {
    var delegate: SignupViewDelegateProtocol? { get set }
    
    init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol,
        delegate: SignupViewDelegateProtocol?
    )
    
    func processUserSignup(formModel: SignupFormModel)
}
