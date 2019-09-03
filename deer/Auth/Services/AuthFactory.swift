//
//  AuthFactory.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import Swinject
import KeychainAccess

final class AuthFactory {
    
    // MARK: - Instance Properties
    
    var emailEntryVC: EmailEntryViewController {
        return container.resolve(EmailEntryViewController.self)!
    }
    
    var keyboardService: KeyboardServiceInterface {
        return container.resolve(KeyboardServiceInterface.self)!
    }
    
    var networkingService: NetworkingServiceInterface {
        return container.resolve(NetworkingServiceInterface.self)!
    }
    
    var keychain: Keychain {
        return container.resolve(Keychain.self)!
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
            let viewModel = EmailEntryViewModel(keyboardService: self.keyboardService,
                                                networking: self.networkingService,
                                                keychain: self.keychain)
            return EmailEntryViewController(viewModel: viewModel)
        }
    }
    
    func register(_ currentUser: User) {
        container.register(UserInterface.self) { _ in
            currentUser
        }
    }
}
