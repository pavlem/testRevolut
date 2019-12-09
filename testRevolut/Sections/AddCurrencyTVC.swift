//
//  AddCurrencyTVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

protocol AddCurrencyTVCDelegate: class {
    func added(currency: String)
}

class AddCurrencyTVC: BaseTVC {
    
    weak var delegate: AddCurrencyTVCDelegate?

    var isFirstCurrency = false
    
    var selectedCurr: String?
    
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
        guard let addCurrencyCell = tableView.dequeueReusableCell(withIdentifier: "AddCurrencyCell_ID", for: indexPath) as? AddCurrencyCell else { return UITableViewCell() }
        
        var addCurrencyVM = addCurrencyVMs[indexPath.row]

        if addCurrencyVM.shortName == self.selectedCurr {
            addCurrencyVM.isEnabled = false
        }
        addCurrencyCell.addCurrencyVM = addCurrencyVM
        return addCurrencyCell
    }
}

// MARK: - UITableViewDelegate
extension AddCurrencyTVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isFirstCurrency {
            let addCurrencyTVC = UIStoryboard.addCurrencyTVC
            addCurrencyTVC.delegate = self.delegate
            addCurrencyTVC.selectedCurr = addCurrencyVMs[indexPath.row].shortName
            navigationController?.pushViewController(addCurrencyTVC, animated: true)
            return
        }
        
        delegate?.added(currency: addCurrencyVMs[indexPath.row].shortName)
        self.dismiss(animated: true) {}
    }
}
