//
//  AuthCoordinatorInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

protocol AuthCoordinatorInterface: Coordinator {
    var didProvideUser: ((UserInterface) -> Void)? { get set }
    var rootViewController: UINavigationController { get }
    var factory: AuthFactory { get }
    func showEmailEntry()
}
