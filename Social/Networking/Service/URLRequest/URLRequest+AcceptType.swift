//
//  URLRequest+AcceptType.swift
//  URLSessionAsyncNetworking
//
/  Created by abdullah tarek on 13/03/2023.
//

import Foundation

extension URLRequest {
    enum AcceptType: String {
        case json = "application/json"
    }
    
    /// Provides a better and cleaner way to access the AcceptType of an API response
    var acceptType: AcceptType? {
        get { AcceptType(rawValue: self.value(forHTTPHeaderField: "Accept") ?? "") }
        set { self.setValue(newValue?.rawValue, forHTTPHeaderField: "Accept")}
    }
}
