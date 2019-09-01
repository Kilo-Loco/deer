//
//  AppDelegate.swift
//  deer
//
//  Created by Kyle Lee on 8/31/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        coordinator = AppCoordinator()
        return coordinator.didFinishLaunching()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
//        self.saveContext()
    }

}

