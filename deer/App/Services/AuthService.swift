//
//  AuthNetworking.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Moya

enum AuthService {
    case createUser(user: UserInterface)
}

extension AuthService: TargetType {
    var baseURL: URL {
        return URL(string: "https://deer-scooter-server.vapor.cloud/api")!
    }
    
    var path: String {
        return "/users"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .createUser(let user):
            return .requestJSONEncodable(user)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
