//
//  SignupView.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 16.05.2023.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject private var viewModel = SignupViewModel(
        presenter: SignupPresenter(
            formModelValidator: SignupFormModelValidator(),
            webService: SignupWebService(urlString: ""),
            delegate: SignupViewDelegate()
        )
    )
    
    var body: some View {
        VStack(spacing: 15) {
            TextField(
                "",
                text: $viewModel.firstName,
                prompt: Text("First name")
            )
            .disabled(true)
            TextField(
                "",
                text: $viewModel.lastName,
                prompt: Text("Last name")
            )
            TextField(
                "",
                text: $viewModel.email,
                prompt: Text("Email")
            )
            SecureField(
                "",
                text: $viewModel.password,
                prompt: Text("Password")
            )
            SecureField(
                "",
                text: $viewModel.repeatPassword,
                prompt: Text("Repeat password")
            )
            
            Button("Signup") {
                print("Did Signup button tap.")
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding(16)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
