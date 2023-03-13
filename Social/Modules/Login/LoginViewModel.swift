//
//  LoginViewModel.swift
//  Social
//
//  Created by abdullah tarek on 13/03/2023.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - Properties -

    @Published var username: String = ""
    @Published var paseeword: String = ""
    @Published var hasError: Bool = false
    @Published var errorText: String = ""

    // MARK: - Logic -

    func validateData() -> Bool {
        guard username.count > 2 else {
            hasError = true
            errorText = "Username too short"
            return false
        }
        
        guard paseeword.count > 5 else {
            hasError = true
            errorText = "Password too short"
            return false
        }
        
        return true
    }
}
