//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(_ coinManager: CoinManager, error: Error)
    func didSelectedCoin(_ coinManager: CoinManager, coin: CoinModel)
    
}


struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D64E2DE6-F0B5-4477-8AC3-2DFAF864A080"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            // 2. URL 세션 만들기
            // URLSession메서드는 우리가 크롬상에서 보던 JSON 과 같은 형식으로 만들어주는 역할을 한다.
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error ) in
                if error != nil {
                    self.delegate?.didFailWithError(self,error: error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didSelectedCoin(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    // 파싱해온 정보 데이터화 시키기
    func parseJSON(_ coinData: Data) -> Double? {
        // JSON을 디코딩할 수 있는 객체
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let lastPrice = decodedData.rate
            
            return lastPrice
        } catch {
            delegate?.didFailWithError(self,error: error)
            return nil
        }
    }
    
    
    
}
