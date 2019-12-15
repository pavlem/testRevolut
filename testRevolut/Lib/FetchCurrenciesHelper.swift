//
//  FetchCurrenciesHelper.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 15/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

struct FetchCurrenciesHelper {
    
    // MARK: - API
    mutating func start(currencyList: [CurrencyListVM]?, success: @escaping (CurrenciesResponse) -> Void) {
        
        guard let currencyList = currencyList else {
            aprint("Cannot start, no currencyList...")
            return
        }
        
        aprint("start(currencyList \(currencyList.count)")
        
        fetchTimer = Timer.scheduledTimer(withTimeInterval: retryTime, repeats: true, block: { (timer) in
            
//            let randomNumber = Double.random(in: 1...20)
//            print("Number: \(randomNumber)")
            
//            let d = ["USDGBP": Double.random(in: 1...20), "GBPEUR": Double.random(in: 1...20), "GBPUSD": Double.random(in: 1...20), "AUDBRL": Double.random(in: 1...20)]
//            let cr = CurrenciesResponse(currenciesDictionary: d)
//            aprint(cr)
//            success(cr)
            
            MOCHelper.fetchMOCCurrencies { (currResp) in
                aprint(currResp)
                success(currResp)
            }
        })
    }
    
    func stop() {
        fetchTimer?.invalidate()
    }
    
    // MARK: - Properties
    private let retryTime = Double(2)
    private var fetchTimer: Timer?
    
    // MARK: - Helper
}
