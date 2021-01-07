//
// Created by stringcode on 07/01/2021.
//

import Foundation

struct Character {

    let id: Int
    let name: String
    let occupations: [String]
    let imageURL: URL
    let status: Status
    let nickname: String
    let appearances: [Int]
    let category: Category
    let appearancesBetterCallSaul: [Int]
}

// MARK: Associated types

extension Character {

    enum Category: String, Decodable {
        case breakingBad = "Breaking Bad"
        case betterCallSaul = "Better Call Saul"
        case both = "Breaking Bad, Better Call Saul"
        case unknown = "Unknown"
    }

    enum Status: String, Decodable {
        case alive = "Alive"
        case deceased = "Deceased"
        case presumedDead = "Presumed dead"
        case unknown = "Unknown"
    }
}

// MARK: - Decodable

extension Character: Decodable {

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name = "name"
        case occupations = "occupation"
        case imageURL = "img"
        case status = "status"
        case nickname = "nickname"
        case appearances = "appearance"
        case category = "category"
        case appearancesBetterCallSaul = "better_call_saul_appearance"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        occupations = try container.decode([String].self, forKey: .occupations)
        imageURL = URL(string: try container.decode(String.self, forKey: .imageURL))!
        status = try container.decode(Status.self, forKey: .status)
        nickname = try container.decode(String.self, forKey: .nickname)
        appearances = try container.decode([Int]?.self, forKey: .appearances) ?? []
        category = try container.decode(Category.self, forKey: .category)
        appearancesBetterCallSaul = try container.decode([Int]?.self, forKey: .appearancesBetterCallSaul) ?? []
    }
}

