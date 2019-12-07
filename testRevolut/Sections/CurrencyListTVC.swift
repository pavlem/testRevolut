//
//  CurrencyListTVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CurrencyListTVC: BaseTVC {
    
    // MARK: - API
    var currencyList = [String]()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Helper
}

// MARK: - Table view data source
extension CurrencyListTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListCell_ID", for: indexPath)
        cell.textLabel?.text = currencyList[indexPath.row]
        return cell
    }
}
