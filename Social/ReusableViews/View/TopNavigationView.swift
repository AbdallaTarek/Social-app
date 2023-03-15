//
//  TopNavigationView.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct TopNavigationView: View {
    @Binding var isFilterEnabled: Bool
    var onChangeText: (String) -> Void
    var body: some View {
        ZStack(alignment: .center) {
            VStack(spacing: 0) {
                if isFilterEnabled {
                    SearchTextField(textPlaceHolder: "Search what you need ...", cancelAction: $isFilterEnabled) { onChangeText($0) }
                } else {
                    HStack {
                        GradientText()
                        Spacer()
                        Button(role: .destructive, action: {
                            withAnimation(.easeInOut(duration: 0.3), {
                                isFilterEnabled = true
                            })
                        }) {
                            Image("search")
                                .frame(width: 20)
                                .aspectRatio(1, contentMode: .fit)
                                .padding(.trailing, 16)
                        }
                    }
                }
            }
            .padding(16)
        }
        .frame(height: 50)
    }
}

struct GradientText: View {
    var body: some View {
        Text("LOGO")
            .gradientForeground(colors: [.red, .blue])
            .font(.system(size: 24, weight: .bold))
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
        .mask(self)
    }
}
