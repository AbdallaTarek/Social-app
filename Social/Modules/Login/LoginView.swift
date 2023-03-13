//
//  LoginView.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    var tapOnSinginAction: (Bool) -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                Image("welcome-image")
                    .resizable()
                    .scaledToFit()

                LoginInformationView(username: $loginViewModel.username, paseeword: $loginViewModel.paseeword)

                MainButtons(titleLabel: "Sign in") {
                    tapOnSinginAction(loginViewModel.validateData())
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .padding(.bottom, 48)
        .alert(loginViewModel.errorText, isPresented: $loginViewModel.hasError) {
            Button("Okay") {
                loginViewModel.hasError = false
            }
        }
    }
}
