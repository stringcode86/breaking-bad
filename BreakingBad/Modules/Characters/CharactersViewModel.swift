//
// Created by stringcode on 07/01/2021.
//

import Foundation

enum CharactersViewModel {
    case loading
    case loaded(_ characters: [CharacterViewModel])
    case failed(_ error: Error)
}

// MARK: - Associated types

extension CharactersViewModel {

    struct CharacterViewModel: Hashable {

        let id: Int
        let name: String
        let imageURL: URL
    }
}

// MARK: - Convenience

extension CharactersViewModel {

    init(characters: [Character]) {
        self = .loaded(
            characters.map {
                .init(
                    id: $0.id,
                    name: $0.name,
                    imageURL: $0.imageURL
                )
            }
        )
    }

    func items() -> [CharacterViewModel] {
        switch self {
        case let .loaded(characters):
            return characters
        default:
            return []
        }
    }
}

// MARK: - Hashable, Equatable

extension CharactersViewModel: Hashable, Equatable {
    
    static func == (lhs: CharactersViewModel, rhs: CharactersViewModel) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.loaded(lChars), .loaded(rChars)):
            return lChars == rChars
        case let (.failed(lError), .failed(rError)):
            return lError.localizedDescription == rError.localizedDescription
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .loading:
            hasher.combine(0)
        case let .loaded(characters):
            hasher.combine(characters)
        case let .failed(error):
            hasher.combine(error.localizedDescription)
        }
    }
}
