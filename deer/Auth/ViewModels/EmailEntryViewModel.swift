//
//  EmailEntryViewModel.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

final class EmailEntryViewModel {
    
    // MARK: - Injected Properties
    
    let keyboardService: KeyboardServiceInterface
    
    
    // MARK: - Initializer
    
    init(keyboardService: KeyboardServiceInterface) {
        self.keyboardService = keyboardService
    }
}
