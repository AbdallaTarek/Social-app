//
//  PostCellView.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import SwiftUI

struct PostCellView: View {
    let post: SinglePostModel
    @Binding var isShowImage: Bool
    @Binding var selectedImage: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            PostUserInformationView(userAvatar: post.userImage, userName: post.username, postTime: "2 Days ago", isShowImage: $isShowImage, selectedImage: $selectedImage)
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

