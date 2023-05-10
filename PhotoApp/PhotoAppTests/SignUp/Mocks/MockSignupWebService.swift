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
    
    func signup(withForm formModel: PhotoApp.SignupFormRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        let responseModel = SignupResponseModel(status: "Ok")
        completionHandler(responseModel, nil)
    }
}
