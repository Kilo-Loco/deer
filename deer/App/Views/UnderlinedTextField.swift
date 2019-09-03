//
//  UnderlinedTextField.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Cartography

class UnderlinedTextField: UITextField {

    // MARK: - Subviews
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        addSubview(underlineView)
        
        constrain(underlineView, self) {
            $0.leading == $1.leading
            $0.trailing == $1.trailing
            $0.bottom == $1.bottom
            $0.height == 1
        }
    }
}
