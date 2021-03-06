//
//  ShowProblem.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
// MARK: - ShowProblem
struct ShowProblem: Codable {
    let posts: [ShowProblemPost]
    let status: Bool?
}

// MARK: - Post
struct ShowProblemPost: Codable {
    let likes: Int?
    let id, name, address, phone: String
    let details, section, userID, createdAt,imgPath: String?
    let updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case likes
        case id = "_id"
        case name, address, phone, details, section,imgPath
        case userID = "userId"
        case createdAt = "created_at"
        case updatedAt
        case v = "__v"
    }
}
 
