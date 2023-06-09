//
//  SignupView.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 16.05.2023.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject private var viewModel = SignupViewModel(
        formModelValidator: SignupFormModelValidator(),
        webService: SignupWebService(urlString: SignupConstants.signupURLString)
    )
    
    var body: some View {
        VStack(spacing: 15) {
            TextField(
                "",
                text: $viewModel.firstName,
                prompt: Text("First name")
            )
            .accessibilityIdentifier("firstNameTextField")
            .alert(
                "Error",
                isPresented: $viewModel.isErrorPresented,
                presenting: viewModel.error
            ) { _ in
                Button("Ok") {
                    
                }
            } message: { error in
                Text(error.text)
            }
            
            TextField(
                "",
                text: $viewModel.lastName,
                prompt: Text("Last name")
            )
            .accessibilityIdentifier("lastNameTextField")
            .alert(
                "Success",
                isPresented: $viewModel.isSuccessPresented,
                presenting: viewModel.successMessage
            ) { _ in
                Button("Ok") {
                    
                }
            } message: { message in
                Text(message)
            }
            
            TextField(
                "",
                text: $viewModel.email,
                prompt: Text("Email")
            )
            .accessibilityIdentifier("emailTextField")
            
            SecureField(
                "",
                text: $viewModel.password,
                prompt: Text("Password")
            )
            .accessibilityIdentifier("passwordSecureField")
            
            SecureField(
                "",
                text: $viewModel.repeatPassword,
                prompt: Text("Repeat password")
            )
            .accessibilityIdentifier("repeatPasswordSecureField")
            
            Button("Signup") {
                print("Did Signup button tap.")
                viewModel.signup()
            }
            .accessibilityIdentifier("signupButton")
            .padding(.top, 20)
            
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding(16)
        .onAppear {
            #if DEBUG
            if CommandLine.arguments.contains("-skipSurvey") {
                print("Skipping survey page")
            }
            #endif
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
