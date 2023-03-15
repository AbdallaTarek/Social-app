//
//  LoadingView.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0

    var body: some View {
        ProgressView(label: {
            Text("loading")
        })
        .scaleEffect(scaleSize, anchor: .center)
        .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: hidden()
        case false: self
        }
    }
}
