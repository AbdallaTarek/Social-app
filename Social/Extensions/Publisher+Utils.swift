//
//  Publisher+Utils.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}
