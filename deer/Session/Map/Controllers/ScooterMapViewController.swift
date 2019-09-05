//
//  ScooterMapViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

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
        setup()
        viewModel.getScooters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.requestLocation()
    }
    
    private func setup() {
        mainView.mapView.delegate = self
        setupObservers()
    }
    
    private func setupObservers() {
        viewModel.mapCameraCoordinates.producer.startWithValues { [weak self] currentLocationCoordinates in
            DispatchQueue.main.async {
                self?.panCamera(to: currentLocationCoordinates)
            }
        }
        
        viewModel.annotationsProperty.producer.startWithValues { [weak self] annotations in
            DispatchQueue.main.async {
                self?.mainView.mapView.addAnnotations(annotations)
            }
        }
    }
    
    private func panCamera(to coordinates: CLLocationCoordinate2D) {
        let camera = mainView.mapView.camera
        camera.centerCoordinate = coordinates
        camera.altitude = 1000
        camera.pitch = 45
    }
}

extension ScooterMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let scooterAnnotation = annotation as? ScooterAnnotation else { return nil }
        
        let identifier = ScooterAnnotation.identifier
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: scooterAnnotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = scooterAnnotation
        }
        
        annotationView!.image = scooterAnnotation.scooterImage
        return annotationView
    }
}
