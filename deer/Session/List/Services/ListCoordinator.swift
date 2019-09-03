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
    private let factory: ListFactory
    
    
    // MARK: - Initializers
    
    init(in tabBarController: UITabBarController, factory: ListFactory) {
        rootViewController = UINavigationController()
        self.factory = factory
        rootViewController.tabBarItem.image = UIImage(named: "listIcon")
        tabBarController.append(rootViewController)
    }
    
    
    // MARK: - Events
    
    func start() {
        showScooterListViewController()
    }
    
    private func showScooterListViewController() {
        rootViewController.pushViewController(factory.scooterListVC, animated: false)
    }
}
