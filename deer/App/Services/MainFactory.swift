//
//  MainFactory.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Swinject

final class MainFactory {
    
    // MARK: - Instance Properties
    
    var authCoordinator: AuthCoordinatorInterface {
        return container.resolve(AuthCoordinatorInterface.self)!
    }
    
    var sessionCoordinator:SessionCoordinatorInterface {
        return container.resolve(SessionCoordinatorInterface.self)!
    }
    
    
    // MARK: Injected Properties
    
    private let container: Container
    
    
    // MARK: - Initializer
    
    init(container: Container = .init()) {
        self.container = container
        registerDependencies()
    }
    
    
    // MARK: - Setup
    
    private func registerDependencies() {
        container.register(KeyboardServiceInterface.self) { _ in
            KeyboardService()
        }
        
        container.register(AuthCoordinatorInterface.self) { [unowned self] _ in
            let navigationController = UINavigationController()
            let authFactory = AuthFactory(container: self.container)
            let authCoordinator = AuthCoordinator(rootViewController: navigationController, factory: authFactory)
            return authCoordinator
        }
        
        container.register(SessionCoordinatorInterface.self) { r in
            let tabBarController = UITabBarController()
            let currentUser = r.resolve(UserInterface.self)!
            let sessionCoordinator = SessionCoordinator(rootViewController: tabBarController, currentUser: currentUser)
            return sessionCoordinator
        }
    }
    
    
    // MARK: - Events
    
    func registerCurrentUser(as user: UserInterface) {
        container.register(UserInterface.self) { _ in user }
    }
}