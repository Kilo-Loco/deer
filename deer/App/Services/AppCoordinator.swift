//
//  AppCoordinator.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Instance Properties
    
    private lazy var state: State = {
        determineState()
    }()
    
    private var childCoordinator: Coordinator?
    
    
    // MARK: Injected Properties
    
    private let window: UIWindow
    
    
    // MARK: - Initializer
    
    init(window: UIWindow = .init(frame: UIScreen.main.bounds)) {
        self.window = window
    }
    
    
    // MARK: - Events
    
    func didFinishLaunching() -> Bool {
        window.rootViewController = InitialViewController()
        window.makeKeyAndVisible()
        return didStartSubFlow()
    }
    
    private func determineState() -> State {
        let user = User(email: try! Email("rekylelee@gmail.com"))
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
        let navigationController = UINavigationController()
        let authCoordinator = AuthCoordinator(rootViewController: navigationController)
        childCoordinator = authCoordinator
        authCoordinator.start()
        return navigationController
    }
    
    private func runSessionFlow(with user: User) -> UITabBarController {
        let tabBarController = UITabBarController()
        let sessionCoordinator = SessionCoordinator(rootViewController: tabBarController, currentUser: user)
        childCoordinator = sessionCoordinator
        sessionCoordinator.start()
        return tabBarController
    }
    
}

extension AppCoordinator {
    enum State {
        case auth
        case session(User)
    }
}
