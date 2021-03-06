//
//  LocationService.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import CoreLocation
import ReactiveSwift

final class LocationService: NSObject {
    
    // MARK: - Communication
    
    let currentLocationPropery = MutableProperty<CLLocation?>(nil)
    
    
    // MARK: - Injected Properties
    
    private let manager: CLLocationManager
    
    init(manager: CLLocationManager = .init()) {
        self.manager = manager
        super.init()
        setupManager()
    }
    
    
    // MARK: - Setup
    
    private func setupManager() {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
    }
    
    
    // MARK: - Events
    
    func requestCurrentLocation() {
        manager.requestWhenInUseAuthorization()
        manager.startMonitoringSignificantLocationChanges()
        sendFirstLocation()
    }
    
    private func sendFirstLocation() {
        currentLocationPropery.value = manager.location
    }
}


// MARK: - CLLocationManagerDelegate

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("updating location")
        currentLocationPropery.value = locations.last
    }
    
    
}
