//
//  Email.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

struct Email: Codable {
    let value: String
    
    init(_ value: String) throws {
        self.value = try Email.validate(value).lowercased()
    }
}

extension Email {
    
    static func isValid(_ value: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let match = NSPredicate(format:"SELF MATCHES %@", regEx)
        return match.evaluate(with: value)
    }
    
    static func validate(_ value: String) throws -> String {
        guard Email.isValid(value) else { throw Error.invalid }
        return value
    }
    
    enum Error: Swift.Error {
        case invalid
    }
}
