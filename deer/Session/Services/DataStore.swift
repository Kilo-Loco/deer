//
//  DataStore.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

final class DataStore: DataStoreInterface {
    
    let networking: NetworkingServiceInterface
    let persistence: PersistenceServiceInterface
    
    init(networking: NetworkingServiceInterface, persistence: PersistenceServiceInterface) {
        self.networking = networking
        self.persistence = persistence
    }
}
