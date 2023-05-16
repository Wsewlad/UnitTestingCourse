//
//  SignupFlowUITests.swift
//  SignupFlowUITests
//
//  Created by  Vladyslav Fil on 16.05.2023.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordSecureField"]
        repeatPassword = app.secureTextFields["repeatPasswordSecureField"]
        signupButton = app.buttons["signupButton"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }
}

//MARK: - Required UI Elements
extension SignupFlowUITests {
    func testSignupView_WhenViewAppeared_RequiredUIElementsAreEnabled() throws {
        XCTAssertTrue(firstName.isEnabled, "First name TextFiled is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name TextFiled is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email TextFiled is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password TextFiled is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password TextFiled is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
    }
}
 
//MARK: - Present Error Alert Dialog
extension SignupFlowUITests {
    func testSignupView_WhenInvalidFormSubmitted_PresentErrorAlertDialog() throws {
        // Act
        firstName.tap()
        firstName.typeText("a")
        
        lastName.tap()
        lastName.typeText("a")
        
        email.tap()
        email.typeText("a")
        
        password.tap()
        password.typeText("a")
        
        repeatPassword.tap()
        repeatPassword.typeText("a")
        
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["Error"].waitForExistence(timeout: 1), "An Error alert dialog was not presented when invalid signup form was submitted")
    }
}

//MARK: - Launch Performance
extension SignupFlowUITests {
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
