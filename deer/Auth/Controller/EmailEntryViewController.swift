//
//  EmailEntryViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

final class EmailEntryViewController: UIViewController {

    // MARK: - Communication
    
//    var didProvideUser: ((UserInterface) -> Void)?
    
    
    // MARK: - Injected Properties
    
    let mainView: EmailEntryView
    let viewModel: EmailEntryViewModel
    
    
    // MARK: - Initializers
    
    init(mainView: EmailEntryView = .init(), viewModel: EmailEntryViewModel) {
        self.mainView = mainView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservations()
    }
    
    
    // MARK: - Setup
    
    private func setupObservations() {
        viewModel.keyboardService.keyboardSignal.observeValues { [weak self] keyboardFrame in
            self?.handle(keyboardFrame)
        }
    }
    
    
    // MARK: - Events
    
    private func handle(_ keyboardFrame: CGRect) {
        mainView.handleKeyboard(with: keyboardFrame.height)
    }
}
