//
//  EmailEntryView.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Mortar

final class EmailEntryView: UIView {
    
    // MARK: - Subviews
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "deerIcon")
        return imageView
    }()
    
    lazy var deerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
        label.text = "d e e r"
        return label
    }()
    
    private lazy var brandStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var emailTextField: UnderlinedTextField = {
        let textField = UnderlinedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter Email"
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CONTINUE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brandPurple
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        
        brandStackView.addArrangedSubview(logoImageView)
        brandStackView.addArrangedSubview(deerLabel)
        
        addSubview(brandStackView)
        addSubview(emailTextField)
        addSubview(continueButton)
        
        brandStackView.m_centerX |=| m_centerX
        brandStackView.m_centerY |=| m_centerY - 100
        logoImageView.m_size |=| 100
        
        emailTextField.m_leading |=| layoutMarginsGuide.m_leading + 20
        emailTextField.m_trailing |=| layoutMarginsGuide.m_trailing - 20
        emailTextField.m_bottom |=| continueButton.m_top - 100
        emailTextField.m_height |=| 35
        
        continueButton.m_leading |=| layoutMarginsGuide.m_leading + 20
        continueButton.m_trailing |=| layoutMarginsGuide.m_trailing - 20
        continueButton.m_bottom |=| layoutMarginsGuide.m_bottom - 20
        continueButton.m_height |=| 45
    }
}
