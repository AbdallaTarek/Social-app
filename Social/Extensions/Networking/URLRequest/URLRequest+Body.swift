//
//  URLRequest+Body.swift
//  Social
//
//  Created by abdullah tarek on 08/03/2023.
//

import Foundation

extension URLRequest {
    /// Directly sets the body parameters as a dictionary
    var bodyParameters: HTTPBodyTextFields {
        get { (try? JSONSerialization.jsonObject(with: self.httpBody ?? Data()) as? [String: Any]) ?? [:] }
        set {
            guard !newValue.isEmpty else { return }
            self.httpBody = newValue.map {
                   "\($0.key)=\($0.value)"
            }.joined(separator: "&").data(using: .utf8)
        }
    }
}
