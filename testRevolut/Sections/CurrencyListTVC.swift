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
    var currencyList = [CurrencyListVM]()
    
    // MARK: - Properties
    // MARK: Outlets
    @IBOutlet weak var addCurrencyBtn: UIButton!
    @IBOutlet weak var addCurrencyTxtBtn: UIButton!
    // MARK: Calculated
    private var currencyVC: CurrencyVC? {
        return self.parent as? CurrencyVC
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: - Actions
    @IBAction func addCurrency(_ sender: Any) {
        let addCurrencyTVC = UIStoryboard.addCurrencyTVC
        addCurrencyTVC.delegate = self
        addCurrencyTVC.modalPresentationStyle = .fullScreen
        addCurrencyTVC.isFirstCurrencyScreen = true
        addCurrencyTVC.allSelectedCurrencies = currencyList
        
        let nc = UINavigationController(rootViewController: addCurrencyTVC)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true) {}
    }
    
    // MARK: - Helper
    private func setUI() {
        addCurrencyBtn.setImage(UIImage.addButon, for: .normal)
        addCurrencyTxtBtn.setTitle(String.addBtnText, for: .normal)
        addCurrencyTxtBtn.setTitleColor(UIColor.lightBlue, for: .normal)
    }
}

// MARK: - Table view data source
extension CurrencyListTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currencyList.count == 0 {
            currencyVC?.setCurrencyListTVCContainer()
        }
        return currencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListCell_ID", for: indexPath) as! CurrencyListCell
        cell.currencyListVM = currencyList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currencyList.remove(at: indexPath.row)
            if currencyList.count == 0 {
                UserDefaultsHelper.shared.removeCurrencies()
            } else {
                UserDefaultsHelper.shared.currencies = currencyList
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            currencyVC?.currencyDeleted()
        }
    }
}

// MARK: - AddCurrencyTVCDelegate
extension CurrencyListTVC: AddCurrencyTVCDelegate {
    func added(currencies: (first: String, second: String)) {
        currencyVC?.added(currencies: (first: currencies.first, second: currencies.second))
    }
}
