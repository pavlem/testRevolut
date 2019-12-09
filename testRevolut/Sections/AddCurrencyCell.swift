//
//  AddCurrencyCell.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 09/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class AddCurrencyCell: UITableViewCell {

    // MARK: - API
    var addCurrencyVM: AddCurrencyVM? {
        willSet {
            setUI(addCurrencyVM: newValue)
        }
    }
    
    // MARK: - Properties
    @IBOutlet weak var currencyImg: UIImageView!
    @IBOutlet weak var currencyLongLbl: UILabel!
    @IBOutlet weak var currencyShortLbl: UILabel!
    
    // MARK: - Helper
    private func setUI(addCurrencyVM: AddCurrencyVM?) {
        currencyLongLbl.text = addCurrencyVM?.longName
        currencyShortLbl.text = addCurrencyVM?.shortName
    }
}
