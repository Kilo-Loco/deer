//
//  MapFactory.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Swinject

final class MapFactory {
    
    // MARK: - Instance Properties
    
    var dataStore: DataStoreInterface {
        return container.resolve(DataStoreInterface.self)!
    }
    
    var scooterMapVC: ScooterMapViewController {
        return container.resolve(ScooterMapViewController.self)!
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
        container.register(ScooterMapViewController.self) { _ in
            let scooterMapVC = ScooterMapViewController()
            scooterMapVC.title = "Map"
            scooterMapVC.navigationItem.title = "d e e r"
            return scooterMapVC
        }
    }
}
