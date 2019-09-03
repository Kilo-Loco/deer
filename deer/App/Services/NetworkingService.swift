//
//  NetworkingService.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import Result

final class NetworkingService: NetworkingServiceInterface {
    
    // MARK: - Injected Properties
    
    let authProvider: MoyaProvider<AuthService>
    
    
    // MARK: - Initializers
    
    init(authProvider: MoyaProvider<AuthService> = .init()) {
        self.authProvider = authProvider
    }
    
}
