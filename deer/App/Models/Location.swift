//
//  Location.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

public class Location: NSObject, NSCoding {
    let latitude: Double
    let longitude: Double
    
    init(with values: Dictionary<String,Any>) {
        latitude = values["latitude"] as! Double
        longitude = values["longitude"] as! Double
    }
    
    public required convenience init(coder decoder: NSCoder) {
        var locationValues = [String:Any]()
        locationValues["latitude"] = decoder.decodeObject(forKey: "latitude") as! Double
        locationValues["longitude"] = decoder.decodeObject(forKey: "longitude") as! Double
        self.init(with: locationValues)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.latitude, forKey: "latitude")
        coder.encode(self.longitude, forKey: "longitude")
    }
}

extension Location: Encodable {}
