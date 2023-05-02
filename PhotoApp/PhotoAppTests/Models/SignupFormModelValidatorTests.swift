//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by  Vladyslav Fil on 28.04.2023.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
}

// MARK: First Name Validation
extension SignupFormModelValidatorTests {
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid("Vladyslav")
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid("V")
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid("VladyslavVladyslav")
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
}

// MARK: Last Name Validation
extension SignupFormModelValidatorTests {
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid("Fil")
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid("F")
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid("FilFilFilFilFilFilFilFilFil")
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
}

// MARK: Email Validation
extension SignupFormModelValidatorTests {
    func testSignFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid("test@gmail.com")
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenEmailWithoutValidEndingProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid("test@gmail.")
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email that has an invalid ending but it has returned TRUE")
    }

    func testSignupFormModelValidator_WhenEmailWithoutAtSignProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid("testAtgmail.com")
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email that doesn't include At sign but it has returned TRUE")
    }
}
