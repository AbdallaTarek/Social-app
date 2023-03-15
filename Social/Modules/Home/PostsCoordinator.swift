//
//  PostsCoordinator.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct PostsCoordinator: View {
    @State var isShowImage: Bool = false
    @State var selectedImage: String = ""
    @State var isFilterEnabled: Bool = false
    @StateObject var viewModel = PostsViewModel()
    @State private var contentHeight: CGFloat = 40

    var onChange: ((String) -> Void)?
    var body: some View {
        VStack {
            TopNavigationView(isFilterEnabled: $isFilterEnabled) { search in
                viewModel.search.send(search)
            }
            ScrollView {
                VStack(spacing: 4) {
                    ForEach(viewModel.posts, id: \.id) { post in
                        PostCellView(post: post, isShowImage: $isShowImage, selectedImage: $selectedImage)
                        Rectangle()
                            .foregroundColor(AppColors.shared.borderColor.opacity(0.6))
                            .frame(height: 1)
                    }
                }
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) {
                    if $0 < (contentHeight - 200) {
                        viewModel.loadMoreContent()
                    }
                }
            }
            .popover(isPresented: $isShowImage) {
                HStack {
                    Image(selectedImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .clipped()
                }
                .padding(16)
            }

        }.coordinateSpace(name: "scroll")
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
