//
//  PlenyServerPath.swift
//
//  Created by abdullah tarek.
//

import Foundation

enum PlenyServerPath {
    case login
    case getPosts
    case getSearchPost
}

extension PlenyServerPath {
    var value: String {
        switch self {
        case .login: return "auth/login"
        case .getPosts: return "posts"
        case .getSearchPost: return "posts/search"
        }
    }
}
