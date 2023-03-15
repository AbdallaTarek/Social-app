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

    @Published var userData: UserModel?
    @Published var hasError: Bool = false
    @Published var errorText: String = ""
    @Published var password: String = "0lelplR"
    @Published var username: String = "kminchelle"

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Logic -

    private func validateData() -> Bool {
        guard username.count > 2 else {
            hasError = true
            errorText = "Username too short"
            return false
        }

        guard password.count > 5 else {
            hasError = true
            errorText = "Password too short"
            return false
        }

        return true
    }
}

// MARK: - Networking -

extension LoginViewModel {
    func loginApi(complation: @escaping (Bool) -> Void) {
        guard validateData() else { return }
        Webservice.main.publishRequest(route: PlenyRouter.login(userName: username, password: password), model: UserModel.self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                    self.hasError = true
                    self.errorText = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { model in
                self.userData = model
                self.hasError = false
                self.errorText = ""
                complation(true)
            }.store(in: &cancellables)
    }
}
