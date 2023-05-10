//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 10.05.2023.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
