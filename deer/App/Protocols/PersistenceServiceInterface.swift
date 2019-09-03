//
//  PersistenceServiceInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

protocol PersistenceServiceInterface {
    var scootersSignal: Signal<[SlateScooter], NoError> { get }
    var scootersObserver: Signal<[SlateScooter], NoError>.Observer { get }
    func save(_ scooters: [Scooter.JSONScooter])
}
