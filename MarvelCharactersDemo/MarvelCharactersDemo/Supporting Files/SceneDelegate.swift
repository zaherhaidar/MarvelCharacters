//
//  SceneDelegate.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        self.appCoordinator = AppCoordinator(window: window)
        let viewControllerCoordinator = CharacterListCoordinator(navigationController: appCoordinator?.navigationController ?? UINavigationController())
        appCoordinator?.start(initialCoordinator: viewControllerCoordinator)
    }
}

