//
// Created by stringcode on 07/01/2021.
//

import Foundation

protocol CharactersService {

    typealias Handler = (Result<[Character], Error>) -> ()

    func fetch(_ handler: @escaping Handler)

}

class DefaultCharactersService {

    private let network: Network

    init(_ network: Network) {
        self.network = network
    }
}

extension DefaultCharactersService: CharactersService {

    func fetch(_ handler: @escaping Handler) {
        network.request(Endpoint.characters, handler: handler)
    }
}

// MARK: - Endpoint

extension DefaultCharactersService {

    enum Endpoint: NetworkEndPoint {
        case characters

        var url: URL {
            return URL(string: "https://breakingbadapi.com/api/characters")!
        }
    }
}