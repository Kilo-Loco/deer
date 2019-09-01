//
//  UITabBarControllerExtensions.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

extension UITabBarController {
    func append(_ viewController: UIViewController) {
        let vcs = (viewControllers ?? []) + [viewController]
        setViewControllers(vcs, animated: false)
    }
}
