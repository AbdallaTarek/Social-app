//
//  LoginInformationView.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct LoginInformationView: View {
    @Binding var username: String
    @Binding var paseeword: String
    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome")
                .foregroundColor(AppColors.shared.mainColor)
                .font(.system(size: 20, weight: .black))

            VStack {
                UsernameTextField(textTitle: "user name", textPlaceHolder: "user name", text: $username)
                PasswordTextField(textTitle: "password", textPlaceHolder: "password", text: $paseeword)
            }
        }
    }
}
