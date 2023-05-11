//
//  SignupViewModelTests.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 11.05.2023.
//

import XCTest
@testable import PhotoApp

final class SignupViewModelTests: XCTestCase {
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var mockSignupPresenter: MockSignupPresenter!
    var sut: SignupViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        mockSignupPresenter = MockSignupPresenter(
            formModelValidator: mockSignupModelValidator,
            webService: mockSignupWebService,
            delegate: mockSignupViewDelegate
        )
        sut = SignupViewModel(presenter: mockSignupPresenter)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        mockSignupPresenter = nil
        sut = nil
    }
}

//MARK: - Required Text Fields Empty
extension SignupViewModelTests {
    func testSignupViewModel_WhenCreated_HasRequiredTextFieldsEmpty() {
        // Arrange
        // Act
        // Assert
        XCTAssertEqual(sut.firstName, "", "First name textField was not empty when the view appeared")
        XCTAssertEqual(sut.lastName, "", "Last name textField was not empty when the view appeared")
        XCTAssertEqual(sut.email, "", "Email textField was not empty when the view appeared")
        XCTAssertEqual(sut.password, "", "Password textField was not empty when the view appeared")
        XCTAssertEqual(sut.repeatPassword, "", "Repeat password textField was not empty when the view appeared")
    }
}

//MARK: - Invoke Signup Process
extension SignupViewModelTests {
    func testSignupViewModel_WhenSignupActionCalled_InvokesSignupProcess() {
        // Arrange
        // Act
        sut.signup()
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a Presenter object when the signup action was called in a SignupViewModel")
    }
}
