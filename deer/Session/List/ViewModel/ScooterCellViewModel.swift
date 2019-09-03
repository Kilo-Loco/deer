//
//  ScooterCellViewModel.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

struct ScooterCellViewModel {
    
    // MARK: - Instance Properties
    
    var scooterName: String {
        return scooter.name
    }
    
    var scooterId: String {
        return scooter.id
    }
    
    
    // MARK: - Injected Properties
    
    private let scooter: SlateScooter
    
    
    // MARK: - Initializer
    
    init(scooter: SlateScooter) {
        self.scooter = scooter
    }
}
