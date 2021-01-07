//
// Created by stringcode on 07/01/2021.
//

import Foundation

struct CharacterDetailViewModel {
    let id: Int
    let name: String
    let occupations: String
    let imageURL: URL
    let status: String
    let nickname: String
    let appearances: String
    let category: String
    let appearancesBetterCallSaul: String
}

// MARK: - Convenience

extension CharacterDetailViewModel {

    init(_ character: Character) {
        id = character.id
        name = character.name
        imageURL = character.imageURL
        status = character.status.rawValue
        nickname = character.nickname
        category = character.category.rawValue
        occupations = character.occupations
            .reduce("") { $0 + ( $0.isEmpty ? "" : ", ") + "\($1)" }
        appearances = character.appearances
            .reduce("") { $0 + ( $0.isEmpty ? "" : ", ") + "\($1)" }
        appearancesBetterCallSaul = character.appearancesBetterCallSaul
            .reduce("") { $0 + ( $0.isEmpty ? "" : ", ") + "\($1)" }
    }
}

// MARK: - Hashable

extension CharacterDetailViewModel: Hashable { }
