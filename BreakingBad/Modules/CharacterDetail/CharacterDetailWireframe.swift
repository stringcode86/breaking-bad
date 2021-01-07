//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol CharacterDetailWireframe {

    func present()
}

class DefaultCharacterDetailWireframe {

    private let character: Character

    private weak var container: UIViewController?

    init(
        character: Character,
        container: UIViewController?
    ) {
        self.character = character
        self.container = container
    }
}

// MARK: - CharacterDetailWireframe

extension DefaultCharacterDetailWireframe: CharacterDetailWireframe{

    func present() {
        let vc = wireUp()
        container?.show(vc, sender: self)
    }
}

// MARK: - Utilities

extension DefaultCharacterDetailWireframe {

    private func wireUp() -> UIViewController {
        let vc: DefaultCharacterDetailView = UIStoryboard(.main).instantiate()
        let presenter = DefaultCharacterDetailPresenter(
            wireframe: self,
            view: vc,
            character: character
        )

        vc.presenter = presenter
        return vc
    }
}