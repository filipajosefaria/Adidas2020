//
//  Goals.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import RealmSwift

struct GoalsResponse: Codable {
    let items: [Goal]
    let nextPageToken: String
}

// MARK: - Item
@objcMembers class Goal: Object, Codable {
    dynamic var id, title, itemDescription, type: String
    dynamic var goal: Int
    dynamic var reward: Reward

    enum CodingKeys: String, CodingKey {
        case id, title
        case itemDescription = "description"
        case type, goal, reward
    }
}

// MARK: - Reward
struct Reward: Codable {
    let trophy: String
    let points: Int
}
