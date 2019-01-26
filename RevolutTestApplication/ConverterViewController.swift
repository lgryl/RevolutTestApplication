//
//  ConverterViewController.swift
//  RevolutTestApplication
//
//  Created by lg on 24/01/2019.
//  Copyright © 2019 lg. All rights reserved.
//

import UIKit

protocol ConverterDisplayable: class {
    
}

class ConverterViewController: UIViewController, ConverterDisplayable {
    
    static let cellIdentifier = "CurrencyCell"
    
    let tableView = UITableView()
    
    let dataProvider: ConverterDataProvider
    let presenter: ConverterPresenter
    
    init(dataProvider: ConverterDataProvider, presenter: ConverterPresenter) {
        self.dataProvider = dataProvider
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("You shouldn't use Storyboard to create this class.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 60.0
        
        let cellXib = UINib(nibName: String(describing: CurrencyCell.self), bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: ConverterViewController.cellIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
            ])
    }
    
}
