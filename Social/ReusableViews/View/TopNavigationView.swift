//
//  TopNavigationView.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct TopNavigationView: View {
    @Binding var isFilterEnabled: Bool
    @State var search: String = ""

    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                if isFilterEnabled {
                    SearchTextField(textPlaceHolder: "Search what you need ...", text: $search, cancelAction: $isFilterEnabled)
                } else {
                    HStack {
                        GradientText()
                        Spacer()
                        Button(role: .destructive, action: {
                            withAnimation {
                                isFilterEnabled = true
                            }

                        }) {
                            Image("search")
                                .frame(width: 16)
                                .aspectRatio(1, contentMode: .fit)
                                .padding(.trailing, 16)
                        }
                    }
                }
            }
            .frame(height: 40)
            .padding(16)
        }
    }
}

struct GradientText: View {
    var body: some View {
        Text("LOGO")
            .gradientForeground(colors: [.red, .blue])
            .font(.system(size: 30, weight: .bold))
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

// struct TopNavigationView_Previews: PreviewProvider {
//    @State var dd: Bool
//    static var previews: some View {
//        TopNavigationView(isFilterEnabled: $dd)
//    }
// }
