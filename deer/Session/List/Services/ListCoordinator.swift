//
//  ListCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class ListCoordinator: Coordinator {
    
    // MARK: - Injected Properties
    
    private let rootViewController: UINavigationController
    
    
    // MARK: - Initializers
    
    init(in tabBarController: UITabBarController) {
        rootViewController = UINavigationController()
        rootViewController.tabBarItem.image = UIImage(named: "listIcon")
        tabBarController.append(rootViewController)
    }
    
    
    // MARK: - Events
    
    func start() {
        showScooterListViewController()
    }
    
    private func showScooterListViewController() {
        let scooterListVC = ScooterListViewController()
        scooterListVC.title = "List"
        scooterListVC.navigationItem.title = "d e e r"
        rootViewController.pushViewController(scooterListVC, animated: false)
    }
}
