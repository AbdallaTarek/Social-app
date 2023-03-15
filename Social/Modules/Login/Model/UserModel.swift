//
//  UserModel.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import Foundation

// MARK: - UserModel

struct UserModel: Codable {
    var id: Int?
    var username, email, firstName, lastName: String?
    var gender: String?
    var image: String?
    var token: String?
    var message : String?
}
