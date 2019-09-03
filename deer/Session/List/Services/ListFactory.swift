//
//  ListFactory.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Swinject

final class ListFactory {
    
    // MARK: - Instance Properties
    
    var scooterListVC: ScooterListViewController {
        return container.resolve(ScooterListViewController.self)!
    }
    
    
    // MARK: Injected Properties
    
    private let container: Container
    private let dataStore: DataStoreInterface
    
    
    // MARK: - Initializer
    
    init(container: Container = .init(), dataStore: DataStoreInterface) {
        self.container = container
        self.dataStore = dataStore
        registerDependencies()
    }
    
    
    // MARK: - Setup
    
    private func registerDependencies() {
        
        container.register(ScooterListViewController.self) { [unowned self] _ in
            let viewModel = ScooterListViewModel(dataStore: self.dataStore)
            let scooterListVC = ScooterListViewController(viewModel: viewModel)
            scooterListVC.title = "List"
            scooterListVC.navigationItem.title = "d e e r"
            return scooterListVC
        }
    }
}
