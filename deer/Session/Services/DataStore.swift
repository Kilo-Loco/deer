//
//  DataStore.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

final class DataStore: DataStoreInterface {
    
    // MARK: - Communication
    
    let scootersProperty = MutableProperty<[SlateScooter]>([])
    
    
    // MARK: - Injected Properties
    
    let networking: NetworkingServiceInterface
    let persistence: PersistenceServiceInterface
    
    
    // MARK: - Initializer
    
    init(networking: NetworkingServiceInterface, persistence: PersistenceServiceInterface) {
        self.networking = networking
        self.persistence = persistence
    }
    
    
    // MARK: - Events
    
    func getScooters() {
        networking.scooterProvider.reactive.request(.getScooters).start() { [weak self] event in
            switch event {
            case .value(let response):
                do {
                    let scooters = try JSONDecoder().decode([Scooter.JSONScooter].self, from: response.data)
                    self?.save(scooters)
                    
                } catch {
                    print(error)
                }
                
            case .failed(let error):
                print(error)
                
            default:
                break
            }
        }
    }
    
    private func save(_ scooters: [Scooter.JSONScooter]) {
        persistence.scootersSignal.observeValues { [weak self] slateScooters in
            self?.scootersProperty.value = slateScooters
        }
        persistence.save(scooters)
    }
}
