//
// Created by stringcode on 6/1/2020.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    weak var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        setupConfiguration()

        ServiceDirectory.Navigation.rootWireframeFactory
            .makeWireframe()
            .present()

        return true
    }

    func setupConfiguration() {
        DefaultConfiguration().bootstrap(window)
    }
}

