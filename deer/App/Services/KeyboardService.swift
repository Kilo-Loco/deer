//
//  KeyboardService.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import ReactiveSwift

final class KeyboardObserver: NSObject {
    
    static let keyboardChange = Notification.Name("KeyboardObserver.keyboardChange")
    
    // Communication
    var didUpdateKeyboardFrame: ((CGRect) -> Void)?
    
    // Tokens
    private var keyboardWillChangeToken: NSObjectProtocol?
    
    // Instance Variabales
    var keyboardFrame: CGRect = .zero {
        didSet { didUpdateKeyboardFrame?(keyboardFrame) }
    }
    
    override init() {
        super.init()
        keyboardWillChangeToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: .main, using: { [weak self] in
            self?.setKeyboardFrame($0)
        })
    }
    
    private func setKeyboardFrame(_ notification: Notification) {
        if let frame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardFrame = frame
            NotificationCenter.default.post(name: KeyboardObserver.keyboardChange, object: frame)
        }
    }
    
    deinit {
        if let token = keyboardWillChangeToken {
            NotificationCenter.default.removeObserver(token)
        }
    }
}
