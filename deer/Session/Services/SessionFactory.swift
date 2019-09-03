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
        
        container.register(Slate.self) { _ in
            return Slate()
        }
        
        container.register(PersistenceServiceInterface.self) { r in
            let slate = r.resolve(Slate.self)!
            return CoreDataService(slate: slate)
        }
        
        container.register(DataStoreInterface.self) { r in
            let networking = r.resolve(NetworkingServiceInterface.self)!
            let persistence = r.resolve(PersistenceServiceInterface.self)!
            return DataStore(networking: networking, persistence: persistence)
        }
        
        let tabBarController = container.resolve(UITabBarController.self)!
        let dataStore = container.resolve(DataStoreInterface.self)!
        
        container.register(MapFactory.self) { [unowned self] _ in
            return MapFactory(container: self.container, dataStore: dataStore)
        }
        
        container.register(MapCoordinator.self) { [unowned tabBarController] r in
            let factory = r.resolve(MapFactory.self)!
            return MapCoordinator(in: tabBarController, factory: factory)
        }
        
        container.register(ListFactory.self) { [unowned self] _ in
            return ListFactory(container: self.container, dataStore: dataStore)
        }
        
        container.register(ListCoordinator.self) { [unowned tabBarController] r in
            let factory = r.resolve(ListFactory.self)!
            return ListCoordinator(in: tabBarController, factory: factory)
        }
        
        
    }
}
