//
//  CharacterDetailCoordinator.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import UIKit

final class CharacterDetailCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController

    var character: CharacterModel?
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = Router.characterDetailVC()
        vc.character = character
        navigationController.push(vc)
    }
}

