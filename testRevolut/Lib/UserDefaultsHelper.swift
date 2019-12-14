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
//                print(myStruct)
                return myStruct
            }
            return nil
        }
        set {
            let encoded = try! JSONEncoder().encode(newValue)
            UserDefaults.standard.set(encoded, forKey: currenciesKey)
        }
    }
    
    private let currenciesKey = "currencies"
}

//extension UserDefaults {
//    func save<T:Encodable>(customObject object: T, inKey key: String) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(object) {
//            self.set(encoded, forKey: key)
//        }
//    }
//
//    func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
//        if let data = self.data(forKey: key) {
//            let decoder = JSONDecoder()
//            if let object = try? decoder.decode(type, from: data) {
//                return object
//            } else {
//                //                aprint("Couldn't decode object")
//                return nil
//            }
//        } else {
//            //            aprint("Couldn't find key")
//            return nil
//        }
//    }
//}
