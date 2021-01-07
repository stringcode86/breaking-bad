//
// Created by stringcode on 07/01/2021.
//

import Foundation

enum CharactersPresenterEvent {
    case didSelectCharacter(_ indexPath: IndexPath)
    case search(_ term: String?)
    case seasonFilter(_ index: Int)
}

protocol CharactersPresenter {

    func present()
    func handleEvent(_ event: CharactersPresenterEvent)
}

final class DefaultCharactersPresenter {

    private let wireframe: CharactersWireframe
    private let interactor: CharactersInteractor

    private weak var view: CharactersView?

    private var characters: [Character] = []
    private var searchTerm: String?
    private var seasonFilterIndex: Int = 0

    init(
        wireframe: CharactersWireframe,
        view: CharactersView,
        interactor: CharactersInteractor
    ) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - CharactersPresenter

extension DefaultCharactersPresenter: CharactersPresenter {

    func present() {
        view?.update(with: .loading)
        interactor.fetchCharacters { [weak self] result in
            DispatchQueue.main.async {
                self?.handleCharactersFetch(result)
            }
        }
    }

    func handleEvent(_ event: CharactersPresenterEvent) {
        switch event {
        case let .didSelectCharacter(indexPath):
            if let character = character(at: indexPath) {
                wireframe.navigateToDetail(character)
            }
        case let .search(term):
            searchTerm = term
            view?.update(with: makeViewModel())
        case let .seasonFilter(index):
            seasonFilterIndex = index
            view?.update(with: makeViewModel())
        }
    }
}

// MARK: - Utilities

extension DefaultCharactersPresenter {

    func handleCharactersFetch(_ result: Result<[Character], Error>) {
        switch result {
        case let .success(characters):
            self.characters = characters
            view?.update(with: makeViewModel())
        case let .failure(error):
            self.characters = []
            view?.update(with: .failed(error))
        }
    }

    func character(at indexPath: IndexPath) -> Character? {
        return currentCharacters()[safe: indexPath.row]
    }

    func currentCharacters() -> [Character] {
        var filteredCharacters = self.characters

        if seasonFilterIndex != 0 {
            filteredCharacters = filteredCharacters.filter {
                $0.appearances.contains(seasonFilterIndex) ||
                $0.appearancesBetterCallSaul.contains(seasonFilterIndex)
            }
        }

        if let term = searchTerm, !term.isEmpty {
            filteredCharacters = filteredCharacters
                .filter { $0.name.fuzzyMatch(term) }
        }

        return filteredCharacters
    }

    func makeViewModel() -> CharactersViewModel {
        return .init(characters: currentCharacters())
    }
}

