//
//  AddCurrencyTVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

protocol AddCurrencyTVCDelegate: class {
    func added(currencies: (first: String, second: String))
}

class AddCurrencyTVC: BaseTVC {
    
    // MARK: - API
    weak var delegate: AddCurrencyTVCDelegate?

    var isFirstCurrencyScreen = false
    var firstSelectedCurrency: String?
    var allSelectedCurrencies: [CurrencyListVM]?
    
    // MARK: - Properties
    private let addCurrencyVMs = AddCurrencyVM.getCurrenciesVMs()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Table view data source
extension AddCurrencyTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCurrencyVMs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addCurrencyCell = tableView.dequeueReusableCell(withIdentifier: "AddCurrencyCell_ID", for: indexPath) as! AddCurrencyCell
        addCurrencyCell.addCurrencyVM = CurrencyListVM.getAddCurrencyVM(from: addCurrencyVMs[indexPath.row], allSelectedCurrencies: allSelectedCurrencies, firstSelectedCurrency: self.firstSelectedCurrency)
        return addCurrencyCell
    }
}

// MARK: - UITableViewDelegate
extension AddCurrencyTVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isFirstCurrencyScreen {
            let addCurrencyTVC = UIStoryboard.addCurrencyTVC
            addCurrencyTVC.delegate = self.delegate
            addCurrencyTVC.firstSelectedCurrency = addCurrencyVMs[indexPath.row].currencyCode
            addCurrencyTVC.allSelectedCurrencies = allSelectedCurrencies
            navigationController?.pushViewController(addCurrencyTVC, animated: true)
            return
        }
        
        delegate?.added(currencies: (first: firstSelectedCurrency!, second: addCurrencyVMs[indexPath.row].currencyCode))
        dismiss(animated: true) {}
    }
}
