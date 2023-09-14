//
//  UINavigationController+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import UIKit

extension UINavigationController {
    var controllersCounts: Int {
        return self.viewControllers.count
    }
    
    var isRootViewController: Bool {
        return controllersCounts <= 1
    }
}
