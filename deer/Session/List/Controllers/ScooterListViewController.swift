//
//  ScooterListViewController.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class ScooterListViewController: UITableViewController {

    // MARK: - Injected Properties
    
    private let viewModel: ScooterListViewModel
    
    
    // MARK: - Initializers
    
    init(viewModel: ScooterListViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getScooters()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        tableView.register(ScooterCell.self, forCellReuseIdentifier: ScooterCell.identifier)
        setupObservers()
    }
    
    private func setupObservers() {
        viewModel.scooterCellViewModels.producer.startWithValues { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    // MARK - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScooterCell.identifier, for: indexPath)
        let scooterCell = cell as? ScooterCell
        scooterCell?.viewModel = viewModel.scooterCellViewModel(for: indexPath)
        return cell
    }
}
