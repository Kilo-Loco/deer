// SlateScooter.swift
// ----- DO NOT MODIFY -----

import Foundation
import CoreData

/** These extensions are available if conversion to basic integer is required */
private extension Int16 {
    var slate_asInt: Int { return Int(self) }
}

private extension Int32 {
    var slate_asInt: Int { return Int(self) }
}

private extension Int64 {
    var slate_asInt: Int { return Int(self) }
}

extension Scooter: SlateObjectConvertible {

    /**
     Instantiates an immutable Slate class from the receiving Core Data class.
     */
    public var slateObject: SlateObject {
        return SlateScooter(managedObject: self)
    }
}

extension Scooter {

    /**
     Helper method that instantiates a Scooter in the specified context.
     */
    public static func create(in moc: NSManagedObjectContext) -> Scooter? {
        guard let entity = NSEntityDescription.entity(forEntityName: "Scooter", in: moc) else {
            return nil
        }

        return Scooter(entity: entity, insertInto: moc)
    }
}

public struct SlateScooter: SlateObject {

    // -- Attribute Declarations --
    public let id: String
    public let latitude: Double?
    public let longitude: Double?
    public let name: String

    // -- Attribute Names --

    public struct Attributes {
        public static let id = "id"
        public static let latitude = "latitude"
        public static let longitude = "longitude"
        public static let name = "name"

    }

    /**
     Identifies the NSManagedObject type that backs this SlateObject
     */
    public static var __slate_managedObjectType: NSManagedObject.Type = Scooter.self

    /**
     Each immutable data model object should have an associated SlateID (in the
     core data case, the NSManagedObjectID.  This is a cross-mutation identifier
     for the object.
    */
    public let slateID: SlateID

    /**
     Instantiation is private to this file; Slate objects should only be instantiated
     by accessing the `slateObject` property of the corresponding managed object.
     */
    fileprivate init(managedObject: Scooter) {
        // All objects inherit the objectID
        self.slateID = managedObject.objectID

        // Attribute assignment
        self.id = { let t: String? = managedObject.id; return t! }()
        self.latitude = managedObject.latitude
        self.longitude = managedObject.longitude
        self.name = { let t: String? = managedObject.name; return t! }()

    }

    // -- Substruct Definitions


}

public extension SlateRelationshipResolver where SO == SlateScooter {

}

extension SlateScooter: Equatable {
    public static func ==(lhs: SlateScooter, rhs: SlateScooter) -> Bool {
        return (lhs.slateID == rhs.slateID) &&
               (lhs.id == rhs.id) &&
               (lhs.latitude == rhs.latitude) &&
               (lhs.longitude == rhs.longitude) &&
               (lhs.name == rhs.name)
    }
}

extension SlateScooter: Encodable {
    
    var location: Location {
        return Location(latitude: latitude ?? 0, longitude: longitude ?? 0)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case location
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
    }
}

extension SlateScooter: CustomStringConvertible {
    public var description: String {
        return """
        
        id: \(id)
        name: \(name)
        location:
            lat: \(location.latitude)
            lon: \(location.longitude)
        
        """
    }
}

