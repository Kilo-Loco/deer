//
//  AuthCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

final class AuthCoordinator: AuthCoordinatorInterface {
    
    // MARK: - Communication
    
    let (userSignal, userObserver) = Signal<User, NoError>.pipe()
    
    
    // MARK: - Observers
    
    var disposableUserObserver: Disposable?
    
    
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
        let emailEntryVC = factory.emailEntryVC
        disposableUserObserver = emailEntryVC.viewModel.userSignal.observeValues { [weak self] user in
            self?.factory.register(user)
            self?.userObserver.send(value: user)
            self?.userObserver.sendCompleted()
        }
        
        rootViewController.pushViewController(emailEntryVC, animated: false)
    }
}
