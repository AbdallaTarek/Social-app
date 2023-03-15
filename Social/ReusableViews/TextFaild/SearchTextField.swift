//
//  SearchTextField.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import SwiftUI

struct SearchTextField: View {
    var textPlaceHolder: String
    @State var text: String = ""
    @Binding var cancelAction: Bool
    var onChanetext: ((String) -> Void)?

    var body: some View {
        HStack {
            TextField(textPlaceHolder, text: $text)
                .onChange(of: text) { newValue in
                    onChanetext?(newValue)
                }
                .font(.system(size: 14))
                .textFieldStyle(.roundedBorder)

            Button {
                withAnimation {
                    cancelAction = false
                }
            } label: {
                Image(systemName: "xmark")
                    .tint(.red)
            }
        }
    }
}
