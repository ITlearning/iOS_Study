//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didSelectedCoin(coin: CoinModel)
    
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
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    // 내 입맛대로 땡겨온 데이터를
                    if let coin = self.parseJSON(safeData) {
                        // ViewController에서 사용해야하니 얘한테 옮김
                        self.delegate?.didSelectedCoin(coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    // 파싱해온 정보 데이터화 시키기
    // 원하는 데이터만 골라 먹기 하는 parseJSON 메서드
    func parseJSON(_ coinData: Data) -> CoinModel? {
        // JSON을 디코딩할 수 있는 객체
        let decoder = JSONDecoder()
        do {
            // 디코더로 땡겨와서
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            // 여기서 원하는 정보들 변수로 저장시키고
            let lastPrice = decodedData.rate
            let name = decodedData.asset_id_quote
            // 모델 파일에 원하는것들만 추가시키고 리턴
            let coin = CoinModel(rate: lastPrice, asset_id_quote: name)
            return coin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
