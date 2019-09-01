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
        tabBarController.append(rootViewController)
    }
    
    func start() {
        showScooterMapViewController()
    }
    
    private func showScooterMapViewController() {
        
        let scooterMapVC = ScooterMapViewController()
        print("made scooter map")
        rootViewController.pushViewController(scooterMapVC, animated: false)
    }
}
