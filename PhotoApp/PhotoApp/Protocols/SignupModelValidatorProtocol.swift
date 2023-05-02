//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 28.04.2023.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(_ value: String) -> Bool
    func isLastNameValid(_ value: String) -> Bool
    func isEmailValid(_ value: String) -> Bool
}
