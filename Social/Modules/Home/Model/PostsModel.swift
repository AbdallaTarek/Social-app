//
//  PostsModel.swift
//  Social
//
//  Created by abdullah tarek on 14/03/2023.
//

import Foundation

// MARK: - SingleTicketModel

let usersNames = ["Neama Ahmed", "Ahmed saad", "Abdullah Tarek", "Ahmad Mohammed", "KFC"]
let usersImage = ["neama-ahmed-image", "ahmed-saad-image", "abdullah-image", "ahmad-mohammed-image", "kfc-logo"]
let postImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYgv_7WcHGDMSb2j_ZbjdqXWr9s0UEumDMag&usqp=CAU",
    "https://assets.cntraveller.in/photos/63beac1d79d81704e445df48/16:9/w_1024%2Cc_limit/Chole-bhature.jpg",
    "https://web-assets.bcg.com/3c/3d/794ddde7481695d246407d66e179/food-for-thought-the-untapped-climate-opportunity-in-alternative-proteins-rectangle.jpg",
    "https://raisingchildren.net.au/__data/assets/image/0033/48786/healthy-food-school-age-children.jpg",
    "https://insanelygoodrecipes.com/wp-content/uploads/2020/08/chicken-strips.png", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYgv_7WcHGDMSb2j_ZbjdqXWr9s0UEumDMag&usqp=CAU",
    "https://assets.cntraveller.in/photos/63beac1d79d81704e445df48/16:9/w_1024%2Cc_limit/Chole-bhature.jpg",
    "https://web-assets.bcg.com/3c/3d/794ddde7481695d246407d66e179/food-for-thought-the-untapped-climate-opportunity-in-alternative-proteins-rectangle.jpg",
    "https://raisingchildren.net.au/__data/assets/image/0033/48786/healthy-food-school-age-children.jpg",
    "https://insanelygoodrecipes.com/wp-content/uploads/2020/08/chicken-strips.png",
    "https://raisingchildren.net.au/__data/assets/image/0033/48786/healthy-food-school-age-children.jpg",
    "https://insanelygoodrecipes.com/wp-content/uploads/2020/08/chicken-strips.png",
]

struct PostsModelModel: Codable {
    var posts: [SinglePostModel]?
    var total, skip, limit: Int?
}

// MARK: - Post

struct SinglePostModel: Codable {
    let userIndex = Int.random(in: 0 ..< 5)
    let randomInt = Int.random(in: 0 ..< 10)

    var id: Int?
    var username: String { return usersNames[userIndex] }
    var userImage: String { return usersImage[userIndex] }

    var title, body: String?
    var userID: Int?
    var tags: [String]?
    var reactions: Int?
    var images: [String] { return postImages.shuffled().prefix(randomInt).map { String($0) } }

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}

struct ImageModel: Codable {
    var id: Int?
    var url: String?
}
