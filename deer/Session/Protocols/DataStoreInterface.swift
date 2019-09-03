//
//  DataStoreInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

protocol DataStoreInterface {
    var scootersSignal: Signal<[SlateScooter], NoError> { get }
    var scootersObserver: Signal<[SlateScooter], NoError>.Observer { get }
    var networking: NetworkingServiceInterface { get }
    var persistence: PersistenceServiceInterface { get }
    func getScooters()
}
