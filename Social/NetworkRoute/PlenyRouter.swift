//
//  SocialApp.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import Foundation

enum PlenyRouter {
    case login(userName: String, password: String)
    case getPosts(limit: Int, skip: Int)
}

extension PlenyRouter: Route {
    var baseURL: String {
        "https://dummyjson.com"
    }

    var routePath: String {
        switch self {
        case .login: return PlenyServerPath.login.value
        case .getPosts: return PlenyServerPath.getPosts.value
        }
    }

    var method: URLRequest.HTTPMethod {
        switch self {
        case .login: return .post
        case .getPosts: return .get
        }
    }

    var body: HTTPBodyTextFields {
        switch self {
        case let .login(userName, password):
            return [
                PlenyParameterKeys.username.rawValue: userName,
                PlenyParameterKeys.password.rawValue: password,
            ]

        default:
            return [:]
        }
    }

    var query: QueryParameters {
        switch self {
        case let .getPosts(limit, skip):
            return [
                PlenyParameterKeys.limit.rawValue: String(describing: limit),
                PlenyParameterKeys.skip.rawValue: String(describing: skip),
            ]

        default:
            return [:]
        }
    }

    var contentType: URLRequest.ContentType {
        .formURLEncoded
    }

    var acceptType: URLRequest.AcceptType {
        .json
    }

    var dataFields: HTTPBodyDataFields {
        switch self {
        case .login, .getPosts:
            return .empty
        }
    }
}
