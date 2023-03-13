//
//  Login.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import SwiftUI

struct LoginCoordinator: View {
    @State private var isLogin = false
    var body: some View {
        if isLogin {
            PostItemView(userAvatar: "avatar", userName: "medhat", postTime: "11:00")
        } else {
            LoginView { isLogin in
                self.isLogin = isLogin
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    let tapOnSinginAction: (Bool) -> Void

    static var previews: some View {
        LoginView { _ in
        }
    }
}
