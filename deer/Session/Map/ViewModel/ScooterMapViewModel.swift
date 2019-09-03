//
//  ScooterMapViewModel.swift
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

final class ScooterMapViewModel {
    
    // MARK: - COmmunication
    
    let (locationSignal, locationObserver) = Signal<CLLocation, NoError>.pipe()
    let scootersProperty = MutableProperty<[SlateScooter]>([])
    let annotationsProperty = MutableProperty<[ScooterAnnotation]>([])
    
    
    // MARK: - Injected Properties
    
    let dataStore: DataStoreInterface
    let locationService: LocationService
    
    
    // MARK: - Initializer
    
    init(dataStore: DataStoreInterface, locationService: LocationService) {
        self.dataStore = dataStore
        self.locationService = locationService
        setupObservers()
    }
    
    
    // MARK: - Setup
    
    private func setupObservers() {
        locationService.currentLocationPropery
            .producer
            .startWithValues { [weak self] currentLocation in
                guard let location = currentLocation else { return }
                self?.locationObserver.send(value: location)
        }
        
        annotationsProperty <~ dataStore.scootersProperty.map { scooters in
            let annotations: [ScooterAnnotation] = scooters.map {
                let annotation = ScooterAnnotation()
                annotation.title = $0.name
                annotation.coordinate = CLLocationCoordinate2D(latitude: $0.location.latitude,
                                                               longitude: $0.location.longitude)
                return annotation
            }
            return annotations
        }
    }
    
    
    // MARK: - Events
    
    func requestLocation() {
        locationService.requestCurrentLocation()
    }
    
    func getScooters() {
        dataStore.getScooters()
    }
}
