//
//  UIViewController+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import UIKit

extension UIViewController {
    
    // MARK: - Router
    
    static func instantiate(storyboard: UIStoryboard, identifier: String? = nil) -> Self {
        return instantiateViewController(type: self, storyboard: storyboard, identifier: identifier ?? typeName)
    }
    
    private static func instantiateViewController<T: UIViewController>(type: T.Type, storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    @discardableResult
    func push(_ viewController: UIViewController, animated: Bool = true) -> UIViewController {
        viewController.hidesBottomBarWhenPushed = true
        
        if let selfVC = self as? UINavigationController {
            selfVC.pushViewController(viewController, animated: animated)
        } else {
            self.navigationController?.pushViewController(viewController, animated: animated)
        }
        
        return viewController
    }
    
    @discardableResult
    func present(_ viewController: UIViewController,
                 presentationStyle: UIModalPresentationStyle = .fullScreen,
                 transitionStyle: UIModalTransitionStyle? = nil,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) -> UIViewController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.isNavigationBarHidden = true
        nav.modalPresentationStyle = presentationStyle
        if let transitionStyle = transitionStyle {
            nav.modalTransitionStyle = transitionStyle
        }
        navigationController?.present(nav, animated: animated, completion: completion)
        return viewController
    }
}
