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
    
    // MARK: - Properties
    // MARK: Outlets
    @IBOutlet weak var addCurrencyBtn: AddBtn!
    @IBOutlet weak var addCurrencyTxtBtn: UIButton!
    // MARK: Calculated
    private var currencyVC: CurrencyVC? {
        return self.parent as? CurrencyVC
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func addCurrency(_ sender: Any) {
        let addCurrencyTVC = UIStoryboard.addCurrencyTVC
        addCurrencyTVC.delegate = self
        addCurrencyTVC.modalPresentationStyle = .fullScreen
        let nc = UINavigationController(rootViewController: addCurrencyTVC)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true) {}
    }
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

// MARK: - AddCurrencyTVCDelegate
extension CurrencyListTVC: AddCurrencyTVCDelegate {
    func added(currency: String) {
        currencyVC?.added(currency: currency)
    }
}
