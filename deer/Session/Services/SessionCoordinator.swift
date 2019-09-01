//
//  SessionCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class SessionCoordinator: Coordinator {
    
    // MARK: - Instance Properties
    
    private var childCoordinators = [Coordinator]()
    
    
    // MARK: Injected Properties
    
    private let rootViewController: UITabBarController
    
    
    // MARK: - Initializer
    
    init(rootViewController: UITabBarController = .init()) {
        self.rootViewController = rootViewController
    }
    
    
    // MARK: - Setup
    
    func start() {
        let mapCoordinator = MapCoordinator(in: rootViewController)
        let listCoordinator = ListCoordinator(in: rootViewController)
        
        childCoordinators = [mapCoordinator, listCoordinator]
        childCoordinators.start()
    }
    
    
}
