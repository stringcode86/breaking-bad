//
// Created by stringcode on 6/1/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        setupConfiguration()

        ServiceDirectory.Navigation.rootWireframeFactory
            .makeWireframe()
            .present()
    }

    func setupConfiguration() {
        DefaultConfiguration().bootstrap(window)
    }
}

