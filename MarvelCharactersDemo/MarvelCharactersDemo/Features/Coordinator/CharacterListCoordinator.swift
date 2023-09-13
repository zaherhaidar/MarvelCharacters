//
//  CharacterListCoordinator.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import UIKit

final class CharacterListCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)

    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let characterListVC = Router.characterListVC()
        characterListVC.viewModel.startCoordinator = self

        navigationController.setViewControllers([characterListVC], animated: false)
    }
    
    func navigateToDetailVC(model: CharacterModel?) {
        let characterDetailCoordinator = CharacterDetailCoordinator(navigationController: navigationController)
        children.append(characterDetailCoordinator)
        characterDetailCoordinator.character = model
        characterDetailCoordinator.start()
    }
}
