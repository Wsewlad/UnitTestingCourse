//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 05.05.2023.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
}
