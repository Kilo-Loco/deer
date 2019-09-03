//
//  ScooterCell.swift
//  deer
//
//  Created by Kyle Lee on 9/3/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Cartography

final class ScooterCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    
    // MARK: - Instance Properties
    
    var viewModel: ScooterCellViewModel! {
        didSet {
            nameLabel.text = viewModel.scooterName
            idLabel.text = viewModel.scooterId
        }
    }
    
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        idLabel.text = ""
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(idLabel)
        
        contentView.addSubview(contentStackView)
        
        constrain(contentStackView, contentView.layoutMarginsGuide) {
            $0.top == $1.top
            $0.leading == $1.leading
            $0.trailing == $1.trailing
            $0.bottom == $1.bottom
        }
    }
}

extension ScooterCell {
    static var identifier: String { return String(describing: self) }
}
