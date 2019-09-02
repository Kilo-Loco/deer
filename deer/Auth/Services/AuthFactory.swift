//
//  AuthFactory.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Swinject

final class AuthFactory {
    
    // MARK: - Instance Properties
    
    var emailEntryVC: EmailEntryViewController {
        return container.resolve(EmailEntryViewController.self)!
    }
    
    var keyboardService: KeyboardServiceInterface {
        return container.resolve(KeyboardServiceInterface.self)!
    }
    
    // MARK: Injected Properties
    
    private let container: Container
    
    
    // MARK: - Initializer
    
    init(container: Container = .init()) {
        self.container = container
        registerDependencies()
    }
    
    
    // MARK: - Setup
    
    private func registerDependencies() {
        container.register(EmailEntryViewController.self) { [unowned self] _ in
            let viewModel = EmailEntryViewModel(keyboardService: self.keyboardService)
            return EmailEntryViewController(viewModel: viewModel)
        }
    }
}
