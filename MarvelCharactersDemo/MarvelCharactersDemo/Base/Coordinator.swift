//
//  Coordinator.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

/*
 The Coordinator pattern is a way to manage the flow and communication between view controllers in an iOS application
 by using a centralized object called a coordinator. The coordinator is responsible for creating and presenting
 view controllers, handling user interactions, managing dependencies, and passing data between view controllers.

 All our coordinators will conform to Coordinator protocol
 */
@objc protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    @objc optional func start(initialCoordinator: Coordinator?)
    func start()
}
