//
//  PlenyServerPath.swift
//
//  Created by abdullah tarek.
//

import Foundation

enum PlenyServerPath {
    case login
    case getPosts
}

extension PlenyServerPath {
    var value: String {
        switch self {
        case .login: return "auth/login"
        case .getPosts: return "posts"
        }
    }
}
