//
// Created by stringcode on 07/01/2021.
//

import UIKit

protocol Configuration {
    
    func bootstrap(_ window: UIWindow?)
}

class DefaultConfiguration: Configuration {
    
    func bootstrap(_ window: UIWindow?) {
        ServiceDirectory.network = DefaultNetwork()
        ServiceDirectory.Cache.image = DefaultImageCache()

        ServiceDirectory.charactersService = DefaultCharactersService(
            ServiceDirectory.network
        )

        ServiceDirectory.Navigation.rootWireframeFactory = DefaultCharactersWireframeFactory(
            window: window,
            charactersService: ServiceDirectory.charactersService,
            characterDetailWireframeFactory: DefaultCharacterDetailWireframeFactory()
        )
    }
}
