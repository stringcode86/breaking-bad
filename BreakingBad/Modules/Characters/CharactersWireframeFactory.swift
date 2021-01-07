//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol CharactersWireframeFactory {

    func makeWireframe() -> CharactersWireframe
}

// MARK: - DefaultCharactersWireframeFactory

class DefaultCharactersWireframeFactory {

    private let charactersService: CharactersService
    private let characterDetailWireframeFactory: CharacterDetailWireframeFactory

    private weak var window: UIWindow?

    init(
        window: UIWindow?,
        charactersService: CharactersService,
        characterDetailWireframeFactory: CharacterDetailWireframeFactory
    ) {
        self.window = window
        self.charactersService = charactersService
        self.characterDetailWireframeFactory = characterDetailWireframeFactory
    }
}

// MARK: - CharactersWireframeFactory

extension DefaultCharactersWireframeFactory: CharactersWireframeFactory {

    func makeWireframe() -> CharactersWireframe {
        return DefaultCharactersWireframe(
            interactor: DefaultCharactersInteractor(
                charactersService: charactersService
            ),
            characterDetailWireframeFactory: characterDetailWireframeFactory,
            window: window
        )
    }
}
