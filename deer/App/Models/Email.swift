//
//  Email.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

struct Email {
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
}

extension Email {
    enum Error: Swift.Error {
        case invalid
    }
}
