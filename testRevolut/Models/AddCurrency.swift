//
//  AddCurrency.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 09/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

struct AddCurrency: Decodable {
    let country: String
    let countryCode: String
    let currency: String
    let code: String
    
    private enum CodingKeys : String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case currency = "Currency"
        case code = "Code"
    }
}
