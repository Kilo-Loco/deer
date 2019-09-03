//
//  ScooterListViewModel.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import CoreLocation
import MapKit

final class ScooterListViewModel {
    
    // MARK: - Communication
    
    let scooterCellViewModels = MutableProperty<[ScooterCellViewModel]>([])
    
    
    // MARK: - Instance Properties
    
    var numberOfRows: Int {
        return scooterCellViewModels.value.count
    }
    
    // MARK: Injected Properties
    
    let dataStore: DataStoreInterface
    
    
    // MARK: - Initializer
    
    init(dataStore: DataStoreInterface) {
        self.dataStore = dataStore
        setupObservers()
    }
    
    
    // MARK: - Setup
    
    private func setupObservers() {
        scooterCellViewModels <~ dataStore.scootersProperty.map { scooters in
            return scooters.map {
                ScooterCellViewModel(scooter: $0)
            }
        }
    }
    
    
    // MARK: - Events
    
    func getScooters() {
        dataStore.getScooters()
    }
    
    func scooterCellViewModel(for indexPath: IndexPath) -> ScooterCellViewModel {
        return scooterCellViewModels.value[indexPath.row]
    }
}
