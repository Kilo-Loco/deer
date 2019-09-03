//
//  EmailEntryViewModel.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

final class EmailEntryViewModel {
    
    // MARK: - Instance Properties
    
    var loginAction: Action<String, String, NoError>!
    
    // MARK: - Injected Properties
    
    let keyboardService: KeyboardServiceInterface
    
    
    // MARK: - Initializer
    
    init(keyboardService: KeyboardServiceInterface) {
        self.keyboardService = keyboardService
        setupObservations()
    }
    
    private func setupObservations() {
        self.loginAction = Action<String, String, NoError> { value in
            return SignalProducer<String, NoError> { (observer, _) in
                print(value)
                
                observer.sendCompleted()
            }
        }
    }
    
    // MARK: - Events
}
