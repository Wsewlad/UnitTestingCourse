//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 05.05.2023.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension SignupWebServiceTests {
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        
        // Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(
            urlString: SignupConstants.signupURLString,
            urlSession: urlSession
        )
        
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: "Vladyslav",
            lastName: "Fil",
            email: "test@gmail.com",
            password: "12345678"
        )
        let expectation = self.expectation(description: "Signup Web  Service Response Expactation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            // "{\"status\": \"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
}
