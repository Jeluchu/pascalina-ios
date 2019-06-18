//
//  AppDelegate.swift
//  Pascalina
//
//  Created by Jesús Calderón on 18/06/2019.
//  Copyright © 2019 Prueba. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        setupView()
        
        return true
    }

    private func setupView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}

