//
//  WeatherManager.swift
//  Clima
//
//  Created by IT learning on 2021/07/17.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c739bf09299ed05af242af0066543929&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. URL 만들기
        if let url = URL(string: urlString) {
            // 2. URL 세션 만들기
            let session = URLSession(configuration: .default)
            
            // 3. 테스크에 주기
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let weather = self.parseJSON(weatherData: safeData)
                }
            }
            
            // 4. 태스크 시작
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            print(error)
            return nil
        }
        
    }
    
}
