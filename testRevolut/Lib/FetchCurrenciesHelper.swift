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
    mutating func start(currencyList: [CurrencyListVM]?) {
        
        guard let currencyList = currencyList else {
            aprint("Cannot start, no currencyList...")
            return
        }
        
        aprint("start(currencyList \(currencyList.count)")
        
        fetchTimer = Timer.scheduledTimer(withTimeInterval: retryTime, repeats: true, block: { (timer) in
            
            let randomNumber = Int.random(in: 1...20)
            print("Number: \(randomNumber)")
            
        })
    }
    
    func stop() {
        fetchTimer?.invalidate()
    }
    
    // MARK: - Properties
    private let retryTime = Double(2)
    var fetchTimer: Timer?
    
    
    // MARK: - Helper
    func fetch() {
        
    }
}
