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
    
    enum Keys: String, CaseIterable {
        
        case currencies
        
        var string: String {
            return self.rawValue
        }
    }
    
    var news: [CurrencyListVM]? {
        get {
            return UserDefaults.standard.retrieve(object: [CurrencyListVM].self, fromKey: Keys.currencies.string)
        }
        set {
            UserDefaults.standard.save(customObject: newValue, inKey: Keys.currencies.string)
        }
    }
}

extension UserDefaults {
    func save<T:Encodable>(customObject object: T, inKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            self.set(encoded, forKey: key)
        }
    }
    
    func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
        if let data = self.data(forKey: key) {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(type, from: data) {
                return object
            } else {
                //                aprint("Couldn't decode object")
                return nil
            }
        } else {
            //            aprint("Couldn't find key")
            return nil
        }
    }
}
