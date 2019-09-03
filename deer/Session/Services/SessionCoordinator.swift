//
//  SessionCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class SessionCoordinator: SessionCoordinatorInterface {
    
    // MARK: - Instance Properties
    
    private var childCoordinators = [Coordinator]()
    
    
    // MARK: Injected Properties
    
    let rootViewController: UITabBarController
    let factory: SessionFactory
//    let dataStore: DataStoreInterface
    
    
    // MARK: - Initializer
    
    init(rootViewController: UITabBarController = .init(), factory: SessionFactory) {
        rootViewController.tabBar.tintColor = .black
        self.rootViewController = rootViewController
        self.factory = factory
//        self.dataStore = factory.dataStore
    }
    
    
    // MARK: - Setup
    
    func start() {
//        dataStore.getScooters()
        
        let mapCoordinator = factory.mapCoordinator
        let listCoordinator = factory.listCoordinator
        
        childCoordinators = [mapCoordinator, listCoordinator]
        childCoordinators.start()
    }
    
    
}
