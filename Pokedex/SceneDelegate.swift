//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 11/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = PokedexViewController()
//        window.rootViewController = HomeViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
