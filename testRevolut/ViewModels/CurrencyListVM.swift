//
//  CurrencyListVM.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 10/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

struct CurrencyListVM: Codable {
    let firstCurrency: String
    let secondCurrency: String
    let firstCurrencyDetail: String
    let secondCurrencyDetail: String
    var value: String = "???"
    
    var firstCurrencyCellTxt: String {
        return "1 " + firstCurrency
    }
    
    var secondCurrencyCellTxt: String {
        return value
    }
    
    var firstCurrencyCellInfoTxt: String {
        return firstCurrencyDetail
    }
    
    var secondCurrencyCellInfoTxt: String {
        return secondCurrencyDetail + "•" + secondCurrency
    }
    
    var firstSecondCombined: String {
        return firstCurrency + secondCurrency
    }
}

// TODO: - unit test
extension CurrencyListVM {
    static func getAddCurrencyVM(from addCurrencyVM: AddCurrencyVM, allSelectedCurrencies: [CurrencyListVM]?, firstSelectedCurrency: String?) -> AddCurrencyVM {
        
        var addCurrencyVM = addCurrencyVM
        if addCurrencyVM.currencyCode == firstSelectedCurrency {
            addCurrencyVM.isEnabled = false
        }
        
        if let allSelectedCurrencies = allSelectedCurrencies {
            for currency in allSelectedCurrencies {
                if currency.firstCurrency == firstSelectedCurrency && currency.secondCurrency == addCurrencyVM.currencyCode {
                    addCurrencyVM.isEnabled = false
                }
            }
        }
        
        return addCurrencyVM
    }
    
    static func getCurrenciesWithRate(fromCurrencies currencies: [CurrencyListVM], currenciesResponse: CurrenciesResponse) -> [CurrencyListVM] {
        var currenciesLo = [CurrencyListVM]()
        for var currency in currencies {
            if let valueDouble = currenciesResponse.currenciesDictionary?[currency.firstSecondCombined] {
                currency.value = String(valueDouble)
            }
            currenciesLo.append(currency)
        }
        return currenciesLo
    }
}
