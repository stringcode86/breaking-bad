//
// Created by stringcode on 07/01/2021.
//

import Foundation

protocol CharactersInteractor {

    typealias Handler = (Result<[Character], Error>) -> ()

    func fetchCharacters(_ handler: @escaping Handler)
}

final class DefaultCharactersInteractor {

    private let charactersService: CharactersService

    init(charactersService: CharactersService) {
        self.charactersService = charactersService
    }
}

// MARK: - CharactersInteractor

extension DefaultCharactersInteractor: CharactersInteractor {

    typealias Handler = (Result<[Character], Error>) -> ()

    func fetchCharacters(_ handler: @escaping Handler) {
        charactersService.fetch(handler)
    }
}
