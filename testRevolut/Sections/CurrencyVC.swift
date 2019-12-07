//
//  CurrencyVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController {

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

        currencyListTVCContainer.isHidden = currencyListTVC?.currencyList.count == 0 ? true : false
    }
    
    // MARK: - Actions
    @IBAction func addCurrency(_ sender: Any) {
        print("Add.....")
        self.present(UIStoryboard.addCurrencyTVC, animated: true) {}
    }
    
    // MARK: - Helper
}
