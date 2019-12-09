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
        
        let ff = JSONHelper.fetchCountries { (_, _) in
            
        }
        
        
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

struct JSONHelper {
    private static func loadJsonDataFromFile(_ path: String, completion: (Data?) -> Void) {
        if let fileUrl = Bundle.main.url(forResource: path, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl, options: [])
                completion(data as Data)
            } catch (let error) {
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

extension JSONHelper {
    static func fetchCountries(completion: @escaping (Bool, [AddCurrency]?) -> Void) {
        let filePath = "countriesList"
        JSONHelper.loadJsonDataFromFile(filePath, completion: { data in
            if let jsonData = data {
                do {
//                    let jsonA = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
//                    print(jsonA ?? "")
                    
                    let addCurrencies = try JSONDecoder().decode([AddCurrency].self, from: jsonData)
                    completion(true, addCurrencies)
                }
                catch _ as NSError {
                    fatalError("Couldn't load data from \(filePath)")
                }
            }
        })
    }
}
