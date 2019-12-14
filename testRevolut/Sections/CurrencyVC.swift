//
//  CurrencyVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController {
    
    // MARK: - API
    func setCurrencyListTVCContainer() {
        currencyListTVCContainer.isHidden = currencyListTVC?.currencyList.count == 0 ? true : false
    }

    // MARK: - Outlets
    @IBOutlet weak var addCurrencyBtn: AddBtn!
    @IBOutlet weak var addCurrencyTxtBtn: UIButton!
    @IBOutlet weak var addCurrencyInfoLbl: UILabel!
    @IBOutlet weak var currencyListTVCContainer: UIView!
    
    private var currencyListTVC: CurrencyListTVC? {
        return self.children.last as? CurrencyListTVC
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setCurrencyListTVCContainer()
    }

    // MARK: - Actions
    @IBAction func addCurrency(_ sender: Any) {
        let addCurrencyTVC = UIStoryboard.addCurrencyTVC
        addCurrencyTVC.delegate = self
        addCurrencyTVC.modalPresentationStyle = .fullScreen
        addCurrencyTVC.isFirstCurrencyScreen = true
        let nc = UINavigationController(rootViewController: addCurrencyTVC)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true) {}
    }
}

// MARK: - AddCurrencyTVCDelegate
extension CurrencyVC: AddCurrencyTVCDelegate {
    func added(currencies: (first: String, second: String)) {
        let addCurrencyVMs = AddCurrencyVM.getCurrenciesVMs()
        let firstCurrency = addCurrencyVMs.filter{ $0.shortName == currencies.first}.first?.longName ?? ""
        let secondCurrency = addCurrencyVMs.filter{ $0.shortName == currencies.second}.first?.longName ?? ""
        let currencyListVM = CurrencyListVM(firstCurrency: currencies.first, secondCurrency: currencies.second, firstCurrencyDetail: firstCurrency, secondCurrencyDetail: secondCurrency)
        currencyListTVC?.currencyList.append(currencyListVM)
        currencyListTVC?.tableView.reloadData()
        setCurrencyListTVCContainer()
    }
}
