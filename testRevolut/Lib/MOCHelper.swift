//
//  MOCHelper.swift
//  ScanAndGo
//
//  Created by Pavle Mijatovic on 7/25/19.
//  Copyright © 2019 Salling Group. All rights reserved.
//

import Foundation

struct MOCHelper {
    
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

extension MOCHelper {
    static func fetchMOCCurrencies(delay: Int = 0, completion: @escaping (CurrenciesResponse) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            let filePath = "currencyList"
            MOCHelper.loadJsonDataFromFile(filePath, completion: { data in
                if let jsonData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Double]
                        let currenciesResponse = CurrenciesResponse(currenciesDictionary: json)
                        completion(currenciesResponse)
//                        let curr = try JSONDecoder().decode([Double].self, from: jsonData)
//                        completion(curr)
                    }
                    catch _ as NSError {
                        fatalError("Couldn't load data from \(filePath)")
                    }
                }
            })
        }
    }
}

