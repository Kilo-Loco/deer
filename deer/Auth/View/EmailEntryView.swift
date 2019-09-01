//
//  EmailEntryView.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class EmailEntryView: UIView {
    
    // MARK: - Subviews
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "deerIcon")
        return imageView
    }()
    
    lazy var emailTextField: UnderlinedTextField = {
        let textField = UnderlinedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter Email"
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        return textField
    }()
}
