//
//  CurrencyListVM.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 10/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

struct CurrencyListVM {
    let firstCurrency: String
    let secondCurrency: String
    
    let firstCurrencyDetail: String
    let secondCurrencyDetail: String
    
    var value: String = "???"
}

// TODO: - unit test
extension CurrencyListVM {
    static func getAddCurrencyVM(from addCurrencyVM: AddCurrencyVM, allSelectedCurrencies: [CurrencyListVM]?, firstSelectedCurrency: String?) -> AddCurrencyVM {
        
        var addCurrencyVM = addCurrencyVM
        if addCurrencyVM.shortName == firstSelectedCurrency {
            addCurrencyVM.isEnabled = false
        }
        
        if let allSelectedCurrencies = allSelectedCurrencies {
            for c in allSelectedCurrencies {
                if c.firstCurrency == firstSelectedCurrency && c.secondCurrency == addCurrencyVM.shortName {
                    addCurrencyVM.isEnabled = false
                }
            }
        }
        
        return addCurrencyVM
    }
}
