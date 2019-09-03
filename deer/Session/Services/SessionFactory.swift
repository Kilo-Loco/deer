//
//  SessionFactory.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Swinject

final class SessionFactory {
    
    // MARK: - Instance Properties
    
    var keyboardService: KeyboardServiceInterface {
        return container.resolve(KeyboardServiceInterface.self)!
    }
    
    var networkingService: NetworkingServiceInterface {
        return container.resolve(NetworkingServiceInterface.self)!
    }
    
    var mapCoordinator: MapCoordinator {
        return container.resolve(MapCoordinator.self)!
    }
    
    var listCoordinator: ListCoordinator {
        return container.resolve(ListCoordinator.self)!
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
        
        let tabBarController = container.resolve(UITabBarController.self)!
        
        container.register(MapCoordinator.self) { [unowned tabBarController] _ in
            return MapCoordinator(in: tabBarController)
        }
        
        container.register(ListCoordinator.self){ [unowned tabBarController] _ in
            return ListCoordinator(in: tabBarController)
        }
        
    }
}
