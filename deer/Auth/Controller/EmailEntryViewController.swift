//
//  EmailEntryViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class EmailEntryViewController: UIViewController {

    // MARK: - Communication
    
    var didProvideUser: ((UserInterface) -> Void)?
    
    
    // MARK: - Injected Properties
    
    let mainView: EmailEntryView
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(mainView: .init())
    }
    
    init(mainView: EmailEntryView = .init()) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
}
