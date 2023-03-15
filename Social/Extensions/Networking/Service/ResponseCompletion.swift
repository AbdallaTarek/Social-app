//
//  ResponseCompletion.swift
//  Social
//
//  Created by abdullah tarek on 09/03/2023.
//

import Foundation

typealias ResponseCompletion<Model> = (Model?, Error?)->Void
