//
//  EmailEntryView.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Cartography

final class EmailEntryView: UIView {
    
    // MARK: - Instance Properties
    
    // MARK: SubViews
    
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
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CONTINUE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brandPurple
        button.layer.cornerRadius = 5
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()
    
    // MARK: Constraints
    
    private let brandStackViewYAxisConstraintGroup = ConstraintGroup()
    private let continueButtonBottomConstraintGroup = ConstraintGroup()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .white
        
        brandStackView.addArrangedSubview(logoImageView)
        brandStackView.addArrangedSubview(deerLabel)
        
        addSubview(brandStackView)
        addSubview(emailTextField)
        addSubview(continueButton)
        
        constrain(brandStackView, self) {
            $0.centerX == $1.centerX
        }
        
        constrain(brandStackView, self, replace: brandStackViewYAxisConstraintGroup) {
            $0.centerY == $1.centerY - 100
        }
        
        constrain(logoImageView) {
            $0.width == 100
            $0.height == 100
        }
        
        constrain(emailTextField, layoutMarginsGuide, continueButton) {
            $0.leading == $1.leading + 20
            $0.trailing == $1.trailing - 20
            $0.bottom == $2.top - 100
            $0.height == 35
        }
        
        constrain(continueButton, layoutMarginsGuide) {
            $0.leading == $1.leading + 20
            $0.trailing == $1.trailing - 20
            $0.height == 45
        }
        
        constrain(continueButton, layoutMarginsGuide, replace: continueButtonBottomConstraintGroup) {
            $0.bottom == $1.bottom - 20
        }
    }
    
    
    // MARK: - Events
    
    func handleKeyboard(with height: CGFloat) {
        constrain(continueButton, layoutMarginsGuide, replace: continueButtonBottomConstraintGroup) {
            $0.bottom == $1.bottom - height
        }
        constrain(brandStackView, self, replace: brandStackViewYAxisConstraintGroup) {
            if height > 100 {
                $0.top == $1.layoutMarginsGuide.top
            } else {
                $0.centerY == $1.centerY - 100
            }
        }
        
        UIView.animate(withDuration: 0.5) { [weak self] in self?.layoutIfNeeded() }
    }
}
