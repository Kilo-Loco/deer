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
import KeychainAccess

final class EmailEntryViewModel {
    
    // MARK: - Communication
    
    let (userSignal, userObserver) = Signal<User, NoError>.pipe()
    var loginAction: Action<String, String, NoError>!
    
    // MARK: - Injected Properties
    
    let keyboardService: KeyboardServiceInterface
    let networking: NetworkingServiceInterface
    let keychain: Keychain
    
    
    // MARK: - Initializer
    
    init(keyboardService: KeyboardServiceInterface, networking: NetworkingServiceInterface, keychain: Keychain) {
        self.keyboardService = keyboardService
        self.networking = networking
        self.keychain = keychain
        setupObservations()
    }
    
    private func setupObservations() {
        self.loginAction = Action<String, String, NoError> { value in
            return SignalProducer<String, NoError> { [weak self] (observer, _) in
                
                do {
                    let email = try Email(value)
                    let user = User(email: email)
                    self?.login(as: user)
                    
                } catch {
                    print(error)
                }
                
                observer.sendCompleted()
            }
        }
        
        userSignal.observeValues {
            print("from observing")
            print($0)
        }
    }
    
    
    // MARK: - Events
    
    private func login(as user: User) {
        networking.authProvider.reactive
            .request(.createUser(user: user))
            .start { [weak self] event in
                switch event {
                    
                case .value(let response):
                    do {
                        let user = try JSONDecoder().decode(User.self, from: response.data)
                        self?.saveUserToKeychain(as: response.data)
                        self?.userObserver.send(value: user)
                        self?.userObserver.sendCompleted()
                        
                    } catch {
                        print(error)
                    }
                    
                case .failed(let error):
                    print(error)
                    
                default:
                    break
                }
            }
    }
    
    private func saveUserToKeychain(as userData: Data) {
        keychain[data: "userData"] = userData
    }
}
