//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 05.05.2023.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(
            urlString: SignupConstants.signupURLString,
            urlSession: urlSession
        )
        signupFormRequestModel = SignupFormRequestModel(
            firstName: "Vladyslav",
            lastName: "Fil",
            email: "test@gmail.com",
            password: "12345678"
        )
    }

    override func tearDown() {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.stubError = nil
    }
}

//MARK: - Successfull Response
extension SignupWebServiceTests {
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup Web Service Response Expactation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
}

//MARK: - Different JSON Response
extension SignupWebServiceTests {
    func testSignupWebService_WhenRecivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\": \"/users\", \"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "signup() method expactation for different JSON response")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request contaning unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsing, "The singnup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
}

//MARK: - Empty URL string
extension SignupWebServiceTests {
    func testSignupWebService_WhenEmptyURLStringProvided_ErrorTookPlace() {
        // Arrange
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "signup() method expactation for empty URL string")
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.invalidUrl, "The singnup() method did not return expected error")
            XCTAssertNil(signupResponseModel, "The response model for a request contaning empty URL string, response should have been nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
}

//MARK: - URLRequest Fails
extension SignupWebServiceTests {
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMassageDescription() {
        // Arrange
        let expectation = self.expectation(description: "A failed request expactation")
        let errorDescription = "A localized description of an error"
        let expectedError = SignupError.failedRequest(description: errorDescription)
        MockURLProtocol.stubError = expectedError

        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, expectedError, "The singnup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
}
