//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let assembly = Assembly()
        let rootViewController = UINavigationController(
            rootViewController: assembly.createCharactersModule()
        )
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
