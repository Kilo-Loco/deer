//
//  AuthCoordinatorInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

protocol AuthCoordinatorInterface: Coordinator {
    var userSignal: Signal<User, NoError> { get }
    var userObserver: Signal<User, NoError>.Observer { get }
    var rootViewController: UINavigationController { get }
    var factory: AuthFactory { get }
    func showEmailEntry()
}
