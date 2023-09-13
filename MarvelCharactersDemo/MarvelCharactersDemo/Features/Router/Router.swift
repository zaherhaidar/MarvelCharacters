//
//  Router.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import UIKit

class Router {
    
    // MARK: - Main
    
    class func characterListVC() -> CharactersListViewController {
        let vc = CharactersListViewController.instantiate(storyboard: mainStoryboard)
        return vc
    }
    
    class func characterDetailVC() -> CharactersDetailsViewController {
        let vc = CharactersDetailsViewController.instantiate(storyboard: mainStoryboard)
        return vc
    }
}

extension Router {

    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
