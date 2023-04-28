//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 28.04.2023.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
}
