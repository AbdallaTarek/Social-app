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
                    tabbarItem()
                }
                .tag(0)

            Text("Second View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(1)

            Text("Third View")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Third")
                }
                .tag(2)
        }
        .accentColor(AppColors.shared.mainColor)
    }
}

struct tabbarItem: View {
    var body: some View {
        Rectangle()
            .background(AppColors.shared.mainColor)
            .frame(width: 20, height: 20)
            .cornerRadius(4, antialiased: true)

        Image("home-icon")
    }
}
