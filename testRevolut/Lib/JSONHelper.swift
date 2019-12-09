//
//  JSONHelper.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 09/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

struct JSONHelper {
    private static func loadJsonDataFromFile(_ path: String) -> Data? {
        if let fileUrl = Bundle.main.url(forResource: path, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl, options: [])
                return data
            } catch (let error) {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
}

extension JSONHelper {
    static func fetchCountriesFromLocalJSON() -> [AddCurrency]? {
        let filePath = "countriesList"
        if let jsonData = JSONHelper.loadJsonDataFromFile(filePath) {
            let addCurrencies = try? JSONDecoder().decode([AddCurrency].self, from: jsonData)
            return addCurrencies
        }
        return nil
    }
}
