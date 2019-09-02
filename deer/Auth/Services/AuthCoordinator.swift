//
//  AuthCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    private let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController = .init()) {
        rootViewController.isNavigationBarHidden = true
        self.rootViewController = rootViewController
        
    }
    
    func start() {
        showEmailEntry()
    }
    
    
    // MARK: - Flows
    
    private func showEmailEntry() {
        let emailEntryVC = EmailEntryViewController()
        rootViewController.pushViewController(emailEntryVC, animated: false)
    }
}
