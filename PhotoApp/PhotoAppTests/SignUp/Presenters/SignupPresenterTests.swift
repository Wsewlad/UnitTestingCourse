//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 07.05.2023.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    
    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(
            firstName: "Vladyslav",
            lastName: "Fil",
            email: "test@gmail.com",
            password: "12345678",
            repeatPassword: "12345678"
        )
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        
        sut = SignupPresenter(
            formModelValidator: mockSignupModelValidator,
            webService: mockSignupWebService
        )
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }
}

extension SignupPresenterTests {
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.arePasswordMatch, "Passwords match was not validated")
    }
}

extension SignupPresenterTests {
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in thr SignupWebService class")
    }
}
