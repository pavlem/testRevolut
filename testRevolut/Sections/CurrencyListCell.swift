//
//  CurrencyListCell.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 10/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CurrencyListCell: UITableViewCell {
    
    // MARK: - API
    var currencyListVM: CurrencyListVM? {
        willSet {
            setUI(currencyListVM: newValue)
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var firstCurrency: UILabel!
    @IBOutlet weak var firstCurrencyInfo: UILabel!
    @IBOutlet weak var secondCurrency: UILabel!
    @IBOutlet weak var secondCurrencyInfo: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    // MARK: - Helper
    private func setUI(currencyListVM: CurrencyListVM?) {
        firstCurrency.text = "1 " + (currencyListVM?.firstCurrency ?? "")
        secondCurrency.text = currencyListVM?.value
        firstCurrencyInfo.text = currencyListVM?.firstCurrencyDetail ?? ""
        secondCurrencyInfo.text = (currencyListVM?.secondCurrencyDetail ?? "") + "•" +  (currencyListVM?.secondCurrency ?? "")
    }
    
    private func setUI() {
        firstCurrency.font = UIFont.systemFont(ofSize: 17)
        firstCurrencyInfo.font = UIFont.systemFont(ofSize: 15)
        secondCurrency.font = UIFont.systemFont(ofSize: 17)
        secondCurrencyInfo.font = UIFont.systemFont(ofSize: 15)
        
        firstCurrency.textColor = .black
        firstCurrencyInfo.textColor = .lightGray
        secondCurrency.textColor = .black
        secondCurrencyInfo.textColor = .lightGray
        
        selectionStyle = .none
    }
}
