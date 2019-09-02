//
//  SessionCoordinatorInterface.swift
//  deer
//
//  Created by Kyle Lee on 9/2/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

protocol SessionCoordinatorInterface: Coordinator {
    var rootViewController: UITabBarController { get }
    var currentUser: UserInterface { get }
}
