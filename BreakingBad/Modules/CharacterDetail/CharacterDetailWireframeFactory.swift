//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol CharacterDetailWireframeFactory {

    func makeWireframe(_ character: Character, container: UIViewController?) -> CharacterDetailWireframe
}

// MARK: - DefaultCharacterDetailWireframeFactory

class DefaultCharacterDetailWireframeFactory {

}

// MARK: - CharacterDetailWireframeFactory

extension DefaultCharacterDetailWireframeFactory: CharacterDetailWireframeFactory {

    func makeWireframe(_ character: Character, container: UIViewController?) -> CharacterDetailWireframe {
        return DefaultCharacterDetailWireframe(
            character: character,
            container: container
        )
    }
}
