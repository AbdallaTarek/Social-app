//
//  MainButtons.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct MainButtons: View {
    var titleLabel: String
    var action: () -> Void
    var body: some View {
        VStack {
            Text(titleLabel)
                .foregroundColor(.white)
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(AppColors.shared.mainColor)
                .clipShape(Capsule())
        }
        .onTapGesture {
            action()
        }
        .padding(.horizontal)
    }
}
