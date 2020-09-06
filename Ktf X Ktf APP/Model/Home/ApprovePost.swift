//
//  ApprovePost.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
// MARK: - ApprovePost
struct ApprovePost: Codable {
    let posts: [ApprovePostDetails]
    let status: Bool
}

// MARK: - Post
struct ApprovePostDetails: Codable {
    let likes: Int
    let solved, approved: Bool
    let id, name, address, phone: String
    let details, section, userID, createdAt: String
    let updatedAt: String
    let v: Int
    let imgPath:String

    enum CodingKeys: String, CodingKey {
        case likes, solved, approved
        case id = "_id"
        case name, address, phone, details, section,imgPath
        case userID = "userId"
        case createdAt = "created_at"
        case updatedAt
        case v = "__v"
    }
}


