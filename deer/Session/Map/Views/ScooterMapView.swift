//
//  ScooterMapView.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Mortar
import MapKit

final class ScooterMapView: UIView {
    
    // MARK: - Subviews
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        return mapView
    }()
    
    lazy var rideButton: CircleButton = {
        let button = CircleButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RIDE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brandPurple
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
        
        mapView |=| self
        rideButton.m_bottom |=| layoutMarginsGuide.m_bottom - 20
        rideButton.m_size |=| 100
        rideButton.m_centerX |=| m_centerX
    }
}

