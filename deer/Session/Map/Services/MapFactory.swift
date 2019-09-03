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
    
    var scooterMapVC: ScooterMapViewController {
        return container.resolve(ScooterMapViewController.self)!
    }
    
    
    // MARK: Injected Properties
    
    private let container: Container
    let dataStore: DataStoreInterface
    
    
    // MARK: - Initializer
    
    init(container: Container = .init(), dataStore: DataStoreInterface) {
        self.container = container
        self.dataStore = dataStore
        registerDependencies()
    }
    
    
    // MARK: - Setup
    
    private func registerDependencies() {
        
        container.register(LocationService.self) { _ in
            return LocationService()
        }
        
        container.register(ScooterMapViewController.self) { [unowned self] r in
            let locationService = r.resolve(LocationService.self)!
            let viewModel = ScooterMapViewModel(dataStore: self.dataStore, locationService: locationService)
            let scooterMapVC = ScooterMapViewController(viewModel: viewModel)
            scooterMapVC.title = "Map"
            scooterMapVC.navigationItem.title = "d e e r"
            return scooterMapVC
        }
    }
}
