//
//  MapCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class MapCoordinator: Coordinator {
    
    private let rootViewController: UINavigationController
    
    init(in tabBarController: UITabBarController) {
        rootViewController = UINavigationController()
        rootViewController.tabBarItem.image = UIImage(named: "mapIcon")
//        tabBarController.
        tabBarController.append(rootViewController)
    }
    
    func start() {
        showScooterMapViewController()
    }
    
    private func showScooterMapViewController() {
        
        let scooterMapVC = ScooterMapViewController()
        scooterMapVC.title = "Map"
        scooterMapVC.navigationItem.title = "d e e r"
        rootViewController.pushViewController(scooterMapVC, animated: false)
    }
}
