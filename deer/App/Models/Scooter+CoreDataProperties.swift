//
//  Scooter+CoreDataProperties.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//
//

import Foundation
import CoreData


extension Scooter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scooter> {
        return NSFetchRequest<Scooter>(entityName: "Scooter")
    }

    @NSManaged public var name: String
    @NSManaged public var id: String
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension Scooter {
    struct JSONScooter: Decodable {
        let id: String
        let name: String
        let location: Location
    }
}
