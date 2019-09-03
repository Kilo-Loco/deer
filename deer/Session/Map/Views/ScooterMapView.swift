//
//  ScooterMapView.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Cartography
import MapKit

final class ScooterMapView: UIView {
    
    // MARK: - Subviews
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
//        mapView.register(ScooterAnnotation.self, forAnnotationViewWithReuseIdentifier: ScooterAnnotation.identifier)
        return mapView
    }()
    
    lazy var rideButton: CircleButton = {
        let button = CircleButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RIDE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brandPurple
        button.isHidden = true
        return button
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        addSubview(mapView)
        addSubview(rideButton)
        
        constrain(mapView, self) {
            $0.top == $1.top
            $0.leading == $1.leading
            $0.trailing == $1.trailing
            $0.bottom == $1.bottom
        }
        
        constrain(rideButton, self) {
            $0.centerX == $1.centerX
            $0.bottom == $1.layoutMarginsGuide.bottom - 20
            $0.width == 100
            $0.height == 100
        }
    }
}

