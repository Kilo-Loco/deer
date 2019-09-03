//
//  MapCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class MapCoordinator: Coordinator {
    
    // MARK: - Injected Properties
    
    private let rootViewController: UINavigationController
    private let factory: MapFactory
    
    
    // MARK: - Initializer
    
    init(in tabBarController: UITabBarController, factory: MapFactory) {
        rootViewController = UINavigationController()
        self.factory = factory
        
        rootViewController.tabBarItem.image = UIImage(named: "mapIcon")
        tabBarController.append(rootViewController)
    }
    
    
    // MARK: Lifecycle
    
    func start() {
        showScooterMapViewController()
    }
    
    
    // MARK: - Flows
    
    private func showScooterMapViewController() {
        rootViewController.pushViewController(factory.scooterMapVC, animated: false)
    }
}
