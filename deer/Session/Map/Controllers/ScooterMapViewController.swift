//
//  ScooterMapViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class ScooterMapViewController: UIViewController {

    // MARK: - Injected Properties
    
    private let mainView: ScooterMapView
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(mainView: .init())
    }
    
    init(mainView: ScooterMapView = .init()) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
}
