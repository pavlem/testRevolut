//
//  CurrencyListTVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CurrencyListTVC: UITableViewController {
    
    let currencyList = [
        "AUD",
        "BGN",
        "BRL",
        "CAD"
    ]

    // MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideFooterView()
    }

    // MARK: - Helper
    private func hideFooterView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.tableFooterView!.isHidden = true
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListCell_ID", for: indexPath)
        cell.textLabel?.text = currencyList[indexPath.row]
        return cell
    }
}
