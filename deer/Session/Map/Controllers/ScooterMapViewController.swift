//
//  ScooterMapViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import CoreLocation

final class ScooterMapViewController: UIViewController {

    // MARK: - Injected Properties
    
    private let mainView: ScooterMapView
    private let viewModel: ScooterMapViewModel
    
    
    // MARK: - Initializers
    
    init(mainView: ScooterMapView = .init(), viewModel: ScooterMapViewModel) {
        self.mainView = mainView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        viewModel.getScooters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.requestLocation()
    }
    
    
    private func setupObservers() {
        viewModel.locationSignal.observeValues { [weak self] location in
//            let coordinates = location.coordinate
//            self?.panCamera(to: coordinates)
            
            let birdOfficeCoordinates = CLLocationCoordinate2D(latitude: 34.0301, longitude: -118.4728)
            self?.panCamera(to: birdOfficeCoordinates)
        }
        viewModel.scootersProperty.producer.startWithValues { (scooters) in
            print("vc scooters", scooters)
        }
    }
    
    private func panCamera(to coordinates: CLLocationCoordinate2D) {
        let camera = mainView.mapView.camera
        camera.centerCoordinate = coordinates
        camera.altitude = 1000
        camera.pitch = 45
    }
}
