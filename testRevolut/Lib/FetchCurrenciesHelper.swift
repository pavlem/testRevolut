//
//  FetchCurrenciesHelper.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 15/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

class FetchCurrenciesHelper {
    
    // MARK: - API
    func start(currencyList: [CurrencyListVM]?, success: @escaping (CurrenciesResponse) -> Void) {
        guard let currencyList = currencyList else { return }
        
        fetchTimer = Timer.scheduledTimer(withTimeInterval: retryTime, repeats: true, block: { (timer) in
            
            self.dataTask?.cancel()
            self.dataTask = self.sendRequest(self.urlString, allPairs: currencyList.map { $0.firstSecondCombined }) { (currencyPairsDictionary, err) in
                
                guard err == nil else { return }
                guard let currencyPairsDictionary = currencyPairsDictionary else { return }
                let currenciesResponse = CurrenciesResponse(currenciesDictionary: currencyPairsDictionary)
                success(currenciesResponse)
            }
        })
    }
    
    func stop() {
        dataTask?.cancel()
        fetchTimer?.invalidate()
    }
    
    // MARK: - Properties
    // MARK: Constants
    private let retryTime = Double(1.0)
    private let urlString = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios"
    
    // MARK: Vars
    private var fetchTimer: Timer?
    private var dataTask: URLSessionDataTask?
    
    // MARK: - Helper
    private func sendRequest(_ url: String, allPairs: [String], completion: @escaping ([String: Double]?, Error?) -> Void) -> URLSessionDataTask {
        
        var components = URLComponents(string: url)!
        var urlQueryItems = [URLQueryItem]()
        for pair in allPairs {
            urlQueryItems.append(URLQueryItem(name: "pairs", value: pair))
        }
        
        components.queryItems = urlQueryItems
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,                            // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                error == nil else {                           // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }
            
            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Double]
            completion(responseObject, nil)
        }
        task.resume()
        return task
    }
}
