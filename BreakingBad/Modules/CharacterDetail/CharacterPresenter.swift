//
// Created by stringcode on 07/01/2021.
//

import Foundation

protocol CharacterDetailPresenter {

    func present()
}

final class DefaultCharacterDetailPresenter {

    private let wireframe: CharacterDetailWireframe
    private let character: Character

    private weak var view: CharacterDetailView?

    init(
        wireframe: CharacterDetailWireframe,
        view: CharacterDetailView,
        character: Character
    ) {
        self.wireframe = wireframe
        self.view = view
        self.character = character
    }
}

// MARK: - CharacterDetailPresenter

extension DefaultCharacterDetailPresenter: CharacterDetailPresenter {

    func present() {
        view?.update(with: makeViewModel())
    }
}

// MARK: - Utilities

extension DefaultCharacterDetailPresenter {

    func makeViewModel() -> CharacterDetailViewModel {
        return .init(character)
    }
}

