//
//  KeyboardService.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

final class KeyboardService: KeyboardServiceInterface {
    
    // MARK: - Communication
    
    private let center = NotificationCenter.default.reactive
    private lazy var keyboardWillShowSignal = center.keyboard(.willShow)
    private lazy var keyboardWillHideSignal = center.keyboard(.didHide)
    
    lazy var keyboardSignal: Signal<CGRect, NoError> = Signal<KeyboardChangeContext, NoError>
        .merge(keyboardWillShowSignal, keyboardWillHideSignal)
        .map { $0.endFrame }
}
