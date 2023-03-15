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

    var skip: Int = 0
    let nextItems = 20
    var limet: Int = 20
    var totalPages: Int = 0
    var cancellables = Set<AnyCancellable>()

    @Published var hasError: Bool = false
    @Published var errorText: String = ""
    @Published var hasMorePosts: Bool = false
    @Published var posts: [SinglePostModel] = []
    var search = CurrentValueSubject<String, Never>("")

    init() {
        search.sink(receiveValue: { [unowned self] value in
            self.resetData()
            if value.isEmpty {
                self.getPostesData()
            } else {
                self.getSearchPostesData()
            }
        }).store(in: &cancellables)
    }

    private func resetData() {
        skip = 0
        limet = 20
        totalPages = 0
        posts.removeAll()
    }

    func loadMoreContent() {
        if limet + nextItems <= totalPages,
           hasMorePosts == true {
            skip = limet
            limet += nextItems
            hasMorePosts = false
            getPostesData()
        }
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
                print(model)

                self.posts.append(contentsOf: model.posts ?? [])
                self.errorText = ""
                self.hasError = false
                self.skip = model.skip ?? 0
                self.limet = model.limit ?? 0
                self.totalPages = model.total ?? 0
                self.hasMorePosts = true
            }.store(in: &cancellables)
    }

    func getSearchPostesData() {
        Webservice.main.publishRequest(route: PlenyRouter.getSearchPost(search: search.value), model: PostsModelModel.self)
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
                print(model)

                self.posts.append(contentsOf: model.posts ?? [])
                self.errorText = ""
                self.hasError = false
                self.skip = model.skip ?? 0
                self.limet = model.limit ?? 0
                self.totalPages = model.total ?? 0
                self.hasMorePosts = model.limit ?? 0 <= model.total ?? 0
            }.store(in: &cancellables)
    }
}
