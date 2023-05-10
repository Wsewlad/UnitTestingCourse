//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 10.05.2023.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, .signupFailed)
            return
        }
        
        let responseModel = SignupResponseModel(status: "Ok")
        completionHandler(responseModel, nil)
    }
}
