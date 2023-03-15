//
//  TabbarView.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: Int = 0

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            PostsCoordinator()
                .tabItem {
                    tabbarItem(image: "home-icon")
                }
                .tag(0)

            Text("Second View")
                .tabItem {
                    tabbarItem(image: "shop")
                }
                .tag(1)

            Text("Third View")
                .tabItem {
                    tabbarItem(image: "discount-shape")
                }
                .tag(2)

            Text("Forth View")
                .tabItem {
                    tabbarItem(image: "profile")
                }
                .tag(3)
        }
        .accentColor(AppColors.shared.mainColor)
    }
}

struct tabbarItem: View {
    var image: String
    var body: some View {
        Rectangle()
            .background(AppColors.shared.mainColor)
            .frame(width: 20, height: 20)
            .cornerRadius(4, antialiased: true)

        Image(image)
    }
}
