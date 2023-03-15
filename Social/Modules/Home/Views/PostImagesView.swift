//
//  PostImagesView.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import SwiftUI

struct PostImagesView: View {
    var images: [String]
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack(spacing: 8) {
                    VStack(spacing: 8) {
                        if images.count == 1 || images.count == 3 {
                            ImageView(url: images[0], width: (proxy.size.width - 5.0) / 2.0)
                        } else {
                            ImageView(url: images[0], width: (proxy.size.width - 5.0) / 2.0)
                            if images.count != 2 {
                                ImageView(url: images[2], width: (proxy.size.width - 5.0) / 2.0)
                            }
                        }
                    }
                    VStack(spacing: 8) {
                        if images.count == 2 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                        } else if images.count == 3 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                            ImageView(url: images[2], width: (proxy.size.width - 5.0) / 2.0)
                        } else if images.count == 4 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                            ImageView(url: images[3], width: (proxy.size.width - 5.0) / 2.0)
                        } else if images.count > 4 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                            ZStack {
                                ImageView(url: images[3], width: (proxy.size.width - 5.0) / 2.0)
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Text("+\(images.count - 4)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .frame(height: proxy.size.width)
                .clipped()
                .cornerRadius(5)
            }
        }
        .environment(\.locale, Locale(identifier: "en"))
    }
}

struct ImageView: View {
    let url: String
    let width: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: width)
                .clipped()
        } placeholder: {
            Image("food-Image-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: width)
                .clipped()
        }
    }
}
