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
    let img: UIImage? = nil
}

extension AddCurrencyVM {
    static func getCurrenciesVMs() -> [AddCurrencyVM] {
        var addCurrencyVMs = [AddCurrencyVM]()
        for key in Array(currencyListDictionary.keys) {
            let addCurrencyVM = AddCurrencyVM(shortName: key, longName: currencyListDictionary[key] ?? "")
            addCurrencyVMs.append(addCurrencyVM)
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
        "IDR" : "Rupiah",
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
