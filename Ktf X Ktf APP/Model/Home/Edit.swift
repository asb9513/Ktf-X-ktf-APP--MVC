//
//  Edit.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation

// MARK: - EditPost
struct EditPos: Codable {
    let post: EditPostPost
    let status: Bool
}

// MARK: - Post
struct EditPostPost: Codable {
    let likes: Int
    let solved, approved: Bool
    let id, name, address, phone: String
    let details: String
    let imgPath: String
    let section, userID, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case likes, solved, approved
        case id = "_id"
        case name, address, phone, details, imgPath, section
        case userID = "userId"
        case createdAt = "created_at"
        case updatedAt
        case v = "__v"
    }
}
