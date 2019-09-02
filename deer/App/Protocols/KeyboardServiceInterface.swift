//
//  KeyboardServiceInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

protocol KeyboardServiceInterface {
    var keyboardSignal: Signal<CGRect, NoError> { get }
}
