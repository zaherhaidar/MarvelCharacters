//
//  AppDelegate.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import CoreData
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        MarvelConfig.setupInstance()

        return true
    }
}
