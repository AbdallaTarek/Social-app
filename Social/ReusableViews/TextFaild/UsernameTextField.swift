//
//  UsertextView.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct UsernameTextField: View {
    var textTitle: String
    var textPlaceHolder: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(textTitle)
                .font(.system(size: 14))
                .frame(height: 16)
            TextField(textPlaceHolder, text: $text)
                .font(.system(size: 14))
                .frame(height: 50)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.horizontal)
    }
}
