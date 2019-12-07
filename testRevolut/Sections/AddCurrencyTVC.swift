//
//  AddCurrencyTVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class AddCurrencyTVC: BaseTVC {

    let currencyList = [
           "AUD",
           "BGN",
           "BRL",
           "CAD",
           "CHF",
           "CNY",
           "CZK",
           "DKK",
           "EUR",
           "GBP",
           "HKD",
           "HRK",
           "HUF",
           "IDR",
           "ILS",
           "INR",
           "ISK",
           "JPY",
           "KRW",
           "MXN",
           "MYR",
           "NOK",
           "NZD",
           "PHP",
           "PLN",
           "RON",
           "RUB",
           "SEK",
           "SGD",
           "THB",
           "USD",
           "ZAR"
       ]
    
    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
}

// MARK: - Table view data source
extension AddCurrencyTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCurrencyCell_ID", for: indexPath)
        cell.textLabel?.text = currencyList[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AddCurrencyTVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
