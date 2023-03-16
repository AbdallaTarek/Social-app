//
//  URLRequest+Body.swift
//  URLSessionAsyncNetworking
//
/  Created by abdullah tarek on 13/03/2023.
//

import Foundation

extension URLRequest {
    /// Directly sets the body parameters as a dictionary
    var bodyParameters: HTTPBodyTextFields {
        get { (try? JSONSerialization.jsonObject(with: self.httpBody ?? Data()) as? [String: Any]) ?? [:] }
        set {
            guard !newValue.isEmpty else { return }
            self.httpBody = try? JSONSerialization.data(withJSONObject: newValue)
        }
    }
}
