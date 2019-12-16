//
//  testRevolutTests.swift
//  testRevolutTests
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import XCTest
@testable import testRevolut

class testRevolutTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    // MARK: - CurrencyListVM
    func testGetCurrenciesWithRate() {
        
        let currencyListVM1 = CurrencyListVM(firstCurrency: "AUD", secondCurrency: "THB", firstCurrencyDetail: "Australian Dollar", secondCurrencyDetail: "Baht")
        let currencyListVM2 = CurrencyListVM(firstCurrency: "DKK", secondCurrency: "EUR", firstCurrencyDetail: "Danish Krone", secondCurrencyDetail: "Euro")
        let currencyListVM3 = CurrencyListVM(firstCurrency: "EUR", secondCurrency: "HKD", firstCurrencyDetail: "Euro", secondCurrencyDetail: "Hong Kong Dollar")

        let currenciesResponse = CurrenciesResponse(currenciesDictionary: ["DKKEUR" : 0.1343, "AUDTHB" : 22.5747])
        
        let currenciesList = CurrencyListVM.getCurrenciesWithRate(fromCurrencies: [currencyListVM1, currencyListVM2, currencyListVM3], currenciesResponse: currenciesResponse)
        
        XCTAssert(currenciesList[0].value == String(22.5747), "🍊🍊, tetsGetCurrenciesWithRate not ok")
        XCTAssert(currenciesList[1].value == String(0.1343), "🍊🍊, tetsGetCurrenciesWithRate not ok")
        XCTAssert(currenciesList[2].value == "???", "🍊🍊, tetsGetCurrenciesWithRate not ok")
    }
}
