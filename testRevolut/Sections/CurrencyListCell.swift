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
            setUI(currencyListVM: currencyListVM)
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var firstCurrency: UILabel!
    @IBOutlet weak var firstCurrencyInfo: UILabel!
    @IBOutlet weak var secondCurrency: UILabel!
    @IBOutlet weak var secondCurrencyInfo: UILabel!
    
    // MARK: - Helper
    func setUI(currencyListVM: CurrencyListVM?) {
        
        
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
