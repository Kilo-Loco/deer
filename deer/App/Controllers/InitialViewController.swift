//
//  InitialViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Cartography

final class InitialViewController: UIViewController {

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "deerIcon")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        
        constrain(logoImageView, view) {
            $0.center == $1.center
            $0.width == 250
            $0.height == 250
        }
    }
}
