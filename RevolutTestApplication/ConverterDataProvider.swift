//
//  ConverterDataProvider.swift
//  RevolutTestApplication
//
//  Created by lg on 26/01/2019.
//  Copyright © 2019 lg. All rights reserved.
//

import UIKit

class ConverterDataProvider: NSObject {
    let model = ["EUR", "PLN", "GBP"]
}

extension ConverterDataProvider: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConverterViewController.cellIdentifier) as? CurrencyCell else {
            fatalError()
        }
        let currencyCode = model[indexPath.row]
        cell.configure(with: currencyCode)
        
        return cell
    }
}

extension ConverterDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}