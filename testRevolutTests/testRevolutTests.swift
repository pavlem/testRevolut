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
    
    func testCurrencyListVMCellStrings() {
        let currencyListVM1 = CurrencyListVM(firstCurrency: "AUD", secondCurrency: "THB", firstCurrencyDetail: "Australian Dollar", secondCurrencyDetail: "Baht")
        
        XCTAssert(currencyListVM1.firstCurrencyCellInfoTxt == "Australian Dollar", "🍊🍊, testCurrencyListVMCellStrings not ok")
        XCTAssert(currencyListVM1.firstCurrencyCellTxt == "1 AUD", "🍊🍊, testCurrencyListVMCellStrings not ok")
        XCTAssert(currencyListVM1.secondCurrencyCellInfoTxt == "Baht•THB", "🍊🍊, testCurrencyListVMCellStrings not ok")
        XCTAssert(currencyListVM1.secondCurrencyCellTxt == "???", "🍊🍊, testCurrencyListVMCellStrings not ok")
        
        let currencyListVM2 = CurrencyListVM(firstCurrency: "DKK", secondCurrency: "EUR", firstCurrencyDetail: "Danish Krone", secondCurrencyDetail: "Euro")

        XCTAssert(currencyListVM2.firstCurrencyCellInfoTxt == "Danish Krone", "🍊🍊, testCurrencyListVMCellStrings not ok")
        XCTAssert(currencyListVM2.firstCurrencyCellTxt == "1 DKK", "🍊🍊, testCurrencyListVMCellStrings not ok")
        XCTAssert(currencyListVM2.secondCurrencyCellInfoTxt == "Euro•EUR", "🍊🍊, testCurrencyListVMCellStrings not ok")
        XCTAssert(currencyListVM2.secondCurrencyCellTxt == "???", "🍊🍊, testCurrencyListVMCellStrings not ok")
    }
    
    func testGetAddCurrencyVM() {
        let currencyListVM1 = CurrencyListVM(firstCurrency: "AUD", secondCurrency: "THB", firstCurrencyDetail: "Australian Dollar", secondCurrencyDetail: "Baht")
        let currencyListVM2 = CurrencyListVM(firstCurrency: "DKK", secondCurrency: "EUR", firstCurrencyDetail: "Danish Krone", secondCurrencyDetail: "Euro")
        let currencyListVM3 = CurrencyListVM(firstCurrency: "EUR", secondCurrency: "HKD", firstCurrencyDetail: "Euro", secondCurrencyDetail: "Hong Kong Dollar")
        let allSelectedCurrencies = [currencyListVM1, currencyListVM2, currencyListVM3]
        let addCurrencyVMs = AddCurrencyVM.getCurrenciesVMs()
        
        let addCurrencyVM11 = CurrencyListVM.getAddCurrencyVM(from: addCurrencyVMs[0], allSelectedCurrencies: allSelectedCurrencies, firstSelectedCurrency: nil)
        
        XCTAssert(addCurrencyVM11.currencyCode == "AUD", "🍊🍊, testGetAddCurrencyVM not ok")
        XCTAssert(addCurrencyVM11.currencyName == "Australian Dollar", "🍊🍊, testGetAddCurrencyVM not ok")
        XCTAssert(addCurrencyVM11.isEnabled == true, "🍊🍊, testGetAddCurrencyVM not ok")
        
        let addCurrencyVM12 = CurrencyListVM.getAddCurrencyVM(from: addCurrencyVMs[0], allSelectedCurrencies: allSelectedCurrencies, firstSelectedCurrency: "AUD")
        
        XCTAssert(addCurrencyVM12.currencyCode == "AUD", "🍊🍊, testGetAddCurrencyVM not ok")
        XCTAssert(addCurrencyVM12.currencyName == "Australian Dollar", "🍊🍊, testGetAddCurrencyVM not ok")
        XCTAssert(addCurrencyVM12.isEnabled == false, "🍊🍊, testGetAddCurrencyVM not ok")
        
        let addCurrencyVM13 = CurrencyListVM.getAddCurrencyVM(from: addCurrencyVMs[0], allSelectedCurrencies: allSelectedCurrencies, firstSelectedCurrency: "EUR")

        XCTAssert(addCurrencyVM13.currencyCode == "AUD", "🍊🍊, testGetAddCurrencyVM not ok")
        XCTAssert(addCurrencyVM13.currencyName == "Australian Dollar", "🍊🍊, testGetAddCurrencyVM not ok")
        XCTAssert(addCurrencyVM13.isEnabled == true, "🍊🍊, testGetAddCurrencyVM not ok")        
    }
}
