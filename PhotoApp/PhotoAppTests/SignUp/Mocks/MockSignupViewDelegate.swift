//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 10.05.2023.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCouner = 0
    var errorSignupCouner = 0
    var signupError: SignupError?
    
    func successfulSignup() {
        successfulSignupCouner += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        errorSignupCouner += 1
        signupError = error
        expectation?.fulfill()
    }
}
