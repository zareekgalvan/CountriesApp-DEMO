//
//  AppDelegate.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.setUpRootFirstController()
        return true
    }
    
    func setUpRootFirstController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialViewController = CountriesListViewController()
        let navController = UINavigationController(rootViewController: initialViewController)
        guard let window = window else { return }
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
    }

}

