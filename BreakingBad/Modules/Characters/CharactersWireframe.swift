//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol CharactersWireframe {
    func present()
    func navigateToDetail(_ model: Character)
}

// MARK: - DefaultCharactersWireframe

class DefaultCharactersWireframe {

    private let interactor: CharactersInteractor
    private let characterDetailWireframeFactory: CharacterDetailWireframeFactory

    private weak var window: UIWindow?

    init(
        interactor: CharactersInteractor,
        characterDetailWireframeFactory: CharacterDetailWireframeFactory,
        window: UIWindow?
    ) {
        self.interactor = interactor
        self.characterDetailWireframeFactory = characterDetailWireframeFactory
        self.window = window
    }
}

// MARK: - CharactersWireframe

extension DefaultCharactersWireframe: CharactersWireframe {

    func present() {
        let vc = wireUp()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

    func navigateToDetail(_ model: Character) {
        characterDetailWireframeFactory.makeWireframe(
            model,
            container: window?.rootViewController
        ).present()
    }
}

extension DefaultCharactersWireframe {

    private func wireUp() -> UIViewController {
        let vc: DefaultCharactersView = UIStoryboard(.main).instantiate()
        let presenter = DefaultCharactersPresenter(
            wireframe: self,
            view: vc,
            interactor: interactor
        )

        vc.presenter = presenter
        return UINavigationController(rootViewController: vc)
    }
}
