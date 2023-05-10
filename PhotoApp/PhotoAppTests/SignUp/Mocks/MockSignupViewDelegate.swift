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
    
    func successfulSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        
    }
}
