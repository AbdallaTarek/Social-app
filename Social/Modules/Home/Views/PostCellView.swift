//
//  PostCellView.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import SwiftUI

struct PostCellView: View {
    let post: SinglePostModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            PostUserInformationView(userAvatar: post.userImage, userName: post.username, postTime: "11:00")

            Text(post.body ?? "")
                .font(.system(size: 14))

            if !post.images.isEmpty {
                PostImagesView(images: post.images)
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .padding()
    }
}

struct PostCellView_Previews: PreviewProvider {
    static var previews: some View {
        PostCellView(post: SinglePostModel(id: 0, title: "Abfullah Tarek", body: "hello world app", userID: 12, tags: [""], reactions: 2))
    }
}
