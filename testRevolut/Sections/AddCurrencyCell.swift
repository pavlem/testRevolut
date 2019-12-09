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
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

    // MARK: - Helper
    private func setUI() {
        currencyImg.layer.cornerRadius = currencyImg.frame.width / 2
        currencyImg.clipsToBounds = true
        currencyLongLbl.font = UIFont.systemFont(ofSize: 15)
        currencyShortLbl.font = currencyLongLbl.font
        currencyLongLbl.textColor = .black
        currencyShortLbl.textColor = .darkGray
        
    }
       
    private func setUI(addCurrencyVM: AddCurrencyVM?) {
        currencyLongLbl.text = addCurrencyVM?.longName
        currencyShortLbl.text = addCurrencyVM?.shortName
        currencyImg.image = addCurrencyVM?.countryIcon
        currencyImg.contentMode = .scaleAspectFill
        
        if addCurrencyVM?.isEnabled == false {
            setDisabledMode()
        }
    }
    
    private func setDisabledMode() {
        self.isUserInteractionEnabled = false
        currencyLongLbl.alpha = 0.5
        currencyShortLbl.alpha = 0.5
    }
}
