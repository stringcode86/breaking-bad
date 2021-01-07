//
// Created by stringcode on 07/01/2021.
//

import Foundation

struct ServiceDirectory {

    static var network: Network!

    static var charactersService: CharactersService!

    enum Navigation {

        static var rootWireframeFactory: CharactersWireframeFactory!
    }

    enum Cache {

        static var image: ImageCacheService!
    }
}
