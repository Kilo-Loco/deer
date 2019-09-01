//
//  Scooter+CoreDataProperties.swift
//  deer
//
//  Created by Kyle Lee on 8/31/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//
//

import Foundation
import CoreData


extension Scooter {
    @NSManaged public var name: String

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scooter> {
        return NSFetchRequest<Scooter>(entityName: "Scooter")
    }
}
