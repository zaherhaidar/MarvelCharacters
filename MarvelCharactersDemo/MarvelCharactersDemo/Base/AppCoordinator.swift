//
//  AppCoordinator.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

/*
 App Coordinator will be responsible for starting our app
 */
final class AppCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController : UINavigationController = UINavigationController()
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(initialCoordinator: Coordinator? = nil) {
        if let initialCoordinator = initialCoordinator {
            children.append(initialCoordinator)
            initialCoordinator.start()
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {}

}
