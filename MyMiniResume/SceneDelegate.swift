//
//  SceneDelegate.swift
//  MyMiniResume
//
//  Created by Лидия Ладанюк on 01.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let profileViewController = ModuleBuilder.createProfileModule()
        let navigationBar = UINavigationController(rootViewController: profileViewController)
        window?.rootViewController = navigationBar
        window?.makeKeyAndVisible()
    }
}

