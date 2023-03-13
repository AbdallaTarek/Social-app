//
//  PostItemView.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct PostItemView: View {
    var userAvatar: String
    var userName: String
    var postTime: String

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(userAvatar)
                .resizable()
                .scaledToFit()
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

struct PostItemView_Previews: PreviewProvider {
    static var previews: some View {
        PostItemView(userAvatar: "avatar", userName: "Abdullah Tarek", postTime: "2 days ago")
    }
}
