//
//  PostsCoordinator.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct PostsCoordinator: View {
    @StateObject var viewModel = PostsViewModel()
    @State var isFilterEnabled: Bool = false
    var body: some View {
        VStack {
            TopNavigationView(isFilterEnabled: $isFilterEnabled)
            ScrollView {
                VStack(spacing: 4) {
                    ForEach(viewModel.posts, id: \.id) { post in
                        PostCellView(post: post)
                        Rectangle()
                            .foregroundColor(AppColors.shared.borderColor.opacity(0.6))
                            .frame(height: 1)
                    }
                }
            }
        }
    }
}

struct PostsCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        PostsCoordinator()
    }
}
