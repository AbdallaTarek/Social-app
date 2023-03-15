//
//  ResponseHandlerError.swift
//  Social
//
//  Created by abdullah tarek on 09/03/2023.
//

import Foundation

enum ResponseHandlerError: Error, LocalizedError {
    case missingInputData
    case missingReturnData
    case APIError(message: String)
}
