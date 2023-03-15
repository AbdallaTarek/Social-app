//
//  PostsCoordinator.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

// import SwiftUI
//
// struct PostsCoordinator: View {
//    @State var isFilterEnabled: Bool = false
//    @StateObject var viewModel = PostsViewModel()
//    @State private var contentHeight: CGFloat = 40
//
//    var onChange: ((String) -> Void)?
//    var body: some View {
//        VStack {
//            TopNavigationView(isFilterEnabled: $isFilterEnabled) { search in
//                viewModel.search.send(search)
//            }
//            ScrollView {
//                VStack(spacing: 4) {
//                    ForEach(viewModel.posts, id: \.id) { post in
//                        PostCellView(post: post)
//                        Rectangle()
//                            .foregroundColor(AppColors.shared.borderColor.opacity(0.6))
//                            .frame(height: 1)
//                    }
//                }
//                .overlay(GeometryReader { geo in
//                    Color.clear.preference(key: HeightPreferenceKey.self, value: geo.size.height)
//                })
//            }
//            .background(GeometryReader {
//                Color.clear.preference(key: HeightPreferenceKey.self,
//                                       value: -$0.frame(in: .named("scroll")).origin.y)
//            })
//            .onPreferenceChange(HeightPreferenceKey.self) {
//                contentHeight = $0
//                print("contentHeight \(contentHeight)")
//            }
//        }.coordinateSpace(name: "scroll")
//    }
// }
//
// struct HeightPreferenceKey: PreferenceKey {
//    typealias Value = CGFloat
//    static var defaultValue: CGFloat = 40
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
// }
import SwiftUI

struct PostsCoordinator: View {
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
                        PostCellView(post: post)
                        Rectangle()
                            .foregroundColor(AppColors.shared.borderColor.opacity(0.6))
                            .frame(height: 1)
                    }
                }
                .overlay(GeometryReader { geo in
                    Color.clear.preference(key: HeightPreferenceKey.self, value: geo.size.height)
                })
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) {
                    if $0 < (contentHeight - 200) {
                        viewModel.loadMoreContent()
                    }
                }
                .background(GeometryReader {
                    Color.clear.preference(key: HeightPreferenceKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(HeightPreferenceKey.self) {
                    contentHeight = $0
                    print("contentHeight \(contentHeight)")
                }
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

struct HeightPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 40
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
