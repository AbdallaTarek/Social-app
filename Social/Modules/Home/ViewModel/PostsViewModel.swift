//
//  PostsViewModel.swift
//  Social
//
//  Created by abdullah tarek on 15/03/2023.
//

import Combine
import Foundation

class PostsViewModel: ObservableObject {
    // MARK: - Properties -

    @Published var posts: [SinglePostModel] = []
    @Published var hasError: Bool = false
    @Published var errorText: String = ""

    var limet: Int = 30
    var skip: Int = 0
    var totalPage: Int = 0
    let nextItems = 30

    private var cancellables = Set<AnyCancellable>()

    init() {
        getPostesData()
    }
}

// MARK: - Networking -

extension PostsViewModel {
    func getPostesData() {
        Webservice.main.publishRequest(route: PlenyRouter.getPosts(limit: limet, skip: skip), model: PostsModelModel.self)
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
                self.posts.append(contentsOf: model.posts ?? [])
                self.limet = model.limit ?? 0
                self.skip = model.skip ?? 0
                self.totalPage = model.total ?? 0
                self.hasError = false
                self.errorText = ""
            }.store(in: &cancellables)
    }
}
