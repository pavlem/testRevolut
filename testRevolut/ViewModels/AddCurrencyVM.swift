//
//  AddCurrencyVM.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 09/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

struct AddCurrencyVM {
    let shortName: String
    let longName: String
    let countryIcon: UIImage
    var isEnabled = true
}

extension AddCurrencyVM {
    static func getCurrenciesVMs() -> [AddCurrencyVM] {
        let countries = JSONHelper.fetchCountriesFromLocalJSON()
        var addCurrencyVMs = [AddCurrencyVM]()
        
        for key in Array(currencyListDictionary.keys) {
            var imgIcon = UIImage()
            
            if let country = countries?.filter({$0.code == key}).first {
                imgIcon = UIImage(named: country.countryCode + "@3x") ?? UIImage()
            }
            
            let addCurrencyVM = AddCurrencyVM(shortName: key, longName: currencyListDictionary[key] ?? "", countryIcon: imgIcon)
            addCurrencyVMs.append(addCurrencyVM)
        }
        
        addCurrencyVMs.sort { ( currency1, currency2) -> Bool in
            return currency1.longName < currency2.longName
        }
        
        return addCurrencyVMs
    }
}

extension AddCurrencyVM {
    static let currencyListDictionary = [
        "AUD" : "Australian Dollar",
        "BGN" : "Bulgarian Lev",
        "BRL" : "Brazilian Real",
        "CAD" : "Canadian Dollar",
        "CHF" : "Swiss Franc",
        "CNY" : "Yuan Renminbi",
        "CZK" : "Czech Koruna",
        "DKK" : "Danish Krone",
        "EUR" : "Euro",
        "GBP" : "Pound Sterling",
        "HKD" : "Hong Kong Dollar",
        "HRK" : "Kuna",
        "HUF" : "Forint",
        "ILS" : "New Israeli Sheqel",
        "INR" : "Indian Rupee",
        "ISK" : "Iceland Krona",
        "JPY" : "Yen",
        "KRW" : "Won",
        "MXN" : "Mexican Peso",
        "MYR" : "Malaysian Ringgit",
        "NOK" : "Norwegian Krone",
        "NZD" : "New Zealand Dollar",
        "PHP" : "Philippine Peso",
        "PLN" : "Zloty",
        "RON" : "Romanian Leu",
        "RUB" : "Russian Ruble",
        "SEK" : "Swedish Krona",
        "SGD" : "Singapore Dollar",
        "THB" : "Baht",
        "USD" : "US Dollar",
        "ZAR" : "Rand"
    ]
}

