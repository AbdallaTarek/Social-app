//
//  URLRequest+HTTPMethod.swift
//  URLSessionAsyncNetworking
//
/  Created by abdullah tarek on 13/03/2023.
//

import Foundation

extension URLRequest {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
    }
    
    /// Assign the HTTP Method of a URL Request
    var method: HTTPMethod? {
        get { HTTPMethod(rawValue: self.httpMethod ?? "") }
        set { self.httpMethod = newValue?.rawValue ?? ""}
    }
}
