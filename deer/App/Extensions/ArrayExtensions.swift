//
//  ArrayExtensions.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

extension Array where Element == Coordinator {
    func start() {
        forEach { $0.start() }
    }
}
