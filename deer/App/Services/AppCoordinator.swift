//
//  AppCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Swinject

final class AppCoordinator {
    
    // MARK: - Instance Properties
    
    private lazy var state: State = {
        determineState()
    }()
    
    private var childCoordinator: Coordinator?
    
    
    // MARK: Injected Properties
    
    private let window: UIWindow
    private let factory: MainFactory
    
    
    // MARK: - Initializer
    
    init(window: UIWindow = .init(frame: UIScreen.main.bounds), factory: MainFactory = .init()) {
        self.window = window
        self.factory = factory
    }
    
    
    // MARK: - Events
    
    func didFinishLaunching() -> Bool {
        window.rootViewController = InitialViewController()
        window.makeKeyAndVisible()
        return didStartSubFlow()
    }
    
    private func determineState() -> State {
        let user = User(email: try! Email("rekylelee@gmail.com"))
        factory.registerCurrentUser(as: user)
        return .session(user)
    }
    
    private func didStartSubFlow() -> Bool {
        var rootViewController: UIViewController
        
        switch state {
        case .auth:
            rootViewController = runAuthFlow()
            
        case .session(let user):
            rootViewController = runSessionFlow(with: user)
        }
        
        window.rootViewController?.present(rootViewController, animated: true)
        
        return true
    }
    
    
    // MARK: - Flows
    
    private func runAuthFlow() -> UINavigationController {
        let authCoordinator = factory.authCoordinator
        childCoordinator = authCoordinator
        authCoordinator.start()
        return authCoordinator.rootViewController
    }
    
    private func runSessionFlow(with user: User) -> UITabBarController {
        let sessionCoordinator = factory.sessionCoordinator
        childCoordinator = sessionCoordinator
        sessionCoordinator.start()
        return sessionCoordinator.rootViewController
    }
}

extension AppCoordinator {
    enum State {
        case auth
        case session(User)
    }
}
