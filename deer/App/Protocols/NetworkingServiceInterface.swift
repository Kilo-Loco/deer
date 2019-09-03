//
//  NetworkingServiceInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Moya

protocol NetworkingServiceInterface {
    var authProvider: MoyaProvider<AuthService> { get }
}
