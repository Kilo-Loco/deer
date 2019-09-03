//
//  ScooterService.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Moya

enum ScooterService {
    case getScooters
    case getScooter(byId: String)
    case createScooter(SlateScooter)
    case updateScooter(toUpdatedScooter: SlateScooter)
    case deleteScooter(byId: String)
}

extension ScooterService: TargetType {
    var baseURL: URL {
        return URL(string: "https://deer-scooter-server.vapor.cloud/api")!
    }
    
    var path: String {
        return "/scooters"
    }
    
    var method: Moya.Method {
        switch self {
        case .getScooters, .getScooter(byId: _):
            return .get
            
        case .createScooter(_):
            return .put
            
        case .updateScooter(toUpdatedScooter: _):
            return .put
            
        case .deleteScooter(byId: _):
            return .delete
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getScooters:
            return .requestPlain
            
        case .getScooter(byId: _), .deleteScooter(byId: _):
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
            
        case .createScooter(let scooter), .updateScooter(toUpdatedScooter: let scooter):
            return .requestJSONEncodable(scooter)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
