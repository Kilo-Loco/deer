//
//  AuthCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class AuthCoordinator: AuthCoordinatorInterface {
    
    // MARK: - Communication
    
    var didProvideUser: ((UserInterface) -> Void)?
    
    
    // MARK: - Injected Properties
    
    let rootViewController: UINavigationController
    let factory: AuthFactory
    
    
    // MARK: - Initializer
    
    init(rootViewController: UINavigationController = .init(), factory: AuthFactory) {
        rootViewController.isNavigationBarHidden = true
        self.rootViewController = rootViewController
        self.factory = factory
    }
    
    
    // MARK: - Lifecycle
    
    func start() {
        showEmailEntry()
    }
    
    
    // MARK: - Flows
    
    func showEmailEntry() {
        rootViewController.pushViewController(factory.emailEntryVC, animated: false)
    }
}
