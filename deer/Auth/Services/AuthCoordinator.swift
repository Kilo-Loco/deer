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
    
    
    // MARK: - Initializer
    
    init(rootViewController: UINavigationController = .init()) {
        rootViewController.isNavigationBarHidden = true
        self.rootViewController = rootViewController
    }
    
    
    // MARK: - Lifecycle
    
    func start() {
        showEmailEntry()
    }
    
    
    // MARK: - Flows
    
    func showEmailEntry() {
        let emailEntryVC = EmailEntryViewController()
        rootViewController.pushViewController(emailEntryVC, animated: false)
    }
}
