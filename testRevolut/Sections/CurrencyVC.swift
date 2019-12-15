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
    
    func currencyStartedEditing() {
        fetchCurrenciesHelper.stop()
    }
    
    func currencyFinishedEditing() {
        startCurrenciesFetch()
    }
    
    var isReturningFromAddCurrency = false
    
    // MARK: - Outlets
    @IBOutlet weak var addCurrencyBtn: UIButton!
    @IBOutlet weak var addCurrencyTxtBtn: UIButton!
    @IBOutlet weak var addCurrencyInfoLbl: UILabel!
    @IBOutlet weak var currencyListTVCContainer: UIView!
    
    private var fetchCurrenciesHelper = FetchCurrenciesHelper()
    
    private var currencyListTVC: CurrencyListTVC? {
        return self.children.last as? CurrencyListTVC
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        fetchAndSetSavedCurrencies { (currencies) in
            DispatchQueue.main.async {
                self.currencyListTVC?.currencyList = currencies
                self.currencyListTVC?.tableView.reloadData()
                self.setCurrencyListTVCContainer()
                self.startCurrenciesFetch()

            }
        }
        setCurrencyListTVCContainer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        if isReturningFromAddCurrency {
            UserDefaultsHelper.shared.currencies = currencyListTVC?.currencyList
            isReturningFromAddCurrency = false
            startCurrenciesFetch()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.fetchCurrenciesHelper.stop()
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
    
    // MARK: - Helper
    private func startCurrenciesFetch() {
        fetchCurrenciesHelper.start(currencyList: currencyListTVC?.currencyList) { [weak self] (currResponse) in
            guard let `self` = self else { return }
            self.updateCurrencyList(currResponse: currResponse)
        }
    }
    
    private func updateCurrencyList(currResponse: CurrenciesResponse) {
        DispatchQueue.main.async {
            self.currencyListTVC?.currencyList = CurrencyListVM.getCurrenciesWithRate(fromCurrencies: self.currencyListTVC!.currencyList, currenciesResponse: currResponse)
            self.currencyListTVC?.tableView.reloadData()
        }
    }
    
    private func setUI() {
        addCurrencyBtn.setImage(UIImage.addBigButon, for: .normal)
        addCurrencyTxtBtn.setTitle(String.addBtnText, for: .normal)
        addCurrencyTxtBtn.setTitleColor(UIColor.lightBlue, for: .normal)
        addCurrencyInfoLbl.textColor = .lightGray
        addCurrencyInfoLbl.text = String.addBtnTextLbl
    }
    
    private func fetchAndSetSavedCurrencies(  completion: @escaping ([CurrencyListVM]) -> ()) {
        DispatchQueue.global().async {
            if let currencies = UserDefaultsHelper.shared.currencies {
                completion(currencies)
            }
        }
    }
}

// MARK: - AddCurrencyTVCDelegate
extension CurrencyVC: AddCurrencyTVCDelegate {
    func added(currencies: (first: String, second: String)) {
        isReturningFromAddCurrency = true
        let addCurrencyVMs = AddCurrencyVM.getCurrenciesVMs()
        let firstCurrency = addCurrencyVMs.filter{ $0.currencyCode == currencies.first}.first?.currencyName ?? ""
        let secondCurrency = addCurrencyVMs.filter{ $0.currencyCode == currencies.second}.first?.currencyName ?? ""
        let currencyListVM = CurrencyListVM(firstCurrency: currencies.first, secondCurrency: currencies.second, firstCurrencyDetail: firstCurrency, secondCurrencyDetail: secondCurrency)
        currencyListTVC?.currencyList.append(currencyListVM)
        currencyListTVC?.tableView.reloadData()
        setCurrencyListTVCContainer()
    }
}
