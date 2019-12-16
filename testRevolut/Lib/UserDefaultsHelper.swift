//
//  UserDefaultsHelper.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 14/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    static let shared = UserDefaultsHelper()
    
    var currencies: [CurrencyListVM]? {
        get {
            if let data = UserDefaults.standard.object(forKey: currenciesKey) as? Data {
                let myStruct = try! JSONDecoder().decode([CurrencyListVM].self, from: data)
                return myStruct
            }
            return nil
        }
        set {
            let encoded = try! JSONEncoder().encode(newValue)
            UserDefaults.standard.set(encoded, forKey: currenciesKey)
        }
    }
    
    func removeCurrencies() {
        UserDefaults.standard.removeObject(forKey: currenciesKey)
    }
    
    private let currenciesKey = "currencies"
}
