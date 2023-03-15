//
//  Login.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import SwiftUI

struct LoginCoordinator: View {
    @State private var isLogin: Bool = false

    var body: some View {
        if isLogin {
            TabbarView()

        } else {
            LoginView(tapOnSinginAction: $isLogin)
        }
    }
}
