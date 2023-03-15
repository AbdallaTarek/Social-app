//
//  PostUserInformationView.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct PostUserInformationView: View {
    var userAvatar: String
    var userName: String
    var postTime: String

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(userAvatar)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Capsule())
            VStack(alignment: .leading, spacing: 4) {
                Text(userName)
                    .font(.system(size: 17, weight: .regular))
                Text(postTime)
                    .font(.system(size: 12, weight: .regular))
            }
            Spacer()
        }
    }
}
