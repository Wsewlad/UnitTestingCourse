//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 10.05.2023.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(
        withForm formModel: SignupFormRequestModel,
        completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void
    ) -> Void
}
