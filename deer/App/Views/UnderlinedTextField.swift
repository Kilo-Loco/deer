//
//  UnderlinedTextField.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Mortar

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
        
        underlineView.m_leading |=| m_leading
        underlineView.m_trailing |=| m_trailing
        underlineView.m_bottom |=| m_bottom
        underlineView.m_height |=| 1
    }
}
