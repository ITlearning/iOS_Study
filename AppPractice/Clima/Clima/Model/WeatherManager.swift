//
//  WeatherManager.swift
//  Clima
//
//  Created by IT learning on 2021/07/29.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManger {
    // API 링크
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c739bf09299ed05af242af0066543929&units=metric"
    
    // 날씨 앱이니까 원하는 곳의 URL을 구성해야 하므로, fetchWeather 메서드를 이용하여 원하는 URL을 구해옴
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        // 만든 URL을 performRequest로 전달
        performRequest(urlString: urlString)
    }
    
    // 네트워킹 4단계를 수행할 곳
    func performRequest(urlString: String) {
        // 1. URL 만들기
        // URL 메서드가 옵셔널로 선언되어있기 때문에 if let 구문으로 nil이 아닐경우 돌아가게 만들어야 한다.
        if let url = URL(string: urlString) {
            // 2. URL 세션 만들기
            // URLSession메서드는 우리가 크롬상에서 보던 JSON 과 같은 형식으로 만들어주는 역할을 한다.
            let session = URLSession(configuration: .default)
            
            // 3. task 에 Session 건네주기
            // dataTask 메서드는 지정된 URL의 내용을 검색한 다음 Handler 메서드에 호출하는 작업을 만든다.
            // 대충 JSON 파일을 처리하는 듯 하다.
            // 이 메서드는 URLSessionDataTask 를 반환한다. 따라서 출력을 상수로 설정할 수 있다.
            // completionHandler는 그냥 매개변수를 받는 용도로 생각할수 있지만, completionHandler가 받는것은 함수이다.
            // task가 인터넷에서 데이터를 가져오는것이 완료될 때마다 handle 메서드를 호출하도록 하고,
            // print문이나 다른것들을 실행할 수 있게 해준다.
            // 사실 이게 핵심이다.
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            // 4. task 시작
            // start가 아니고 resume인 이유는 중간에 url이 잘못되어 데이터가 잘 못나올수도 있으니
            // start대신 resume으로 시작한다.
            task.resume()
        }
    }
    
    // hendle 메서드를 이용하여 task를 실행할 수 있다.
    // 이 메서드로 데이터를 줄수도 있고, 응답을 할 수도 있고, 에러또한 반환이 가능하다.
    func handle(data: Data?, response: URLResponse?, error: Error?)-> Void {
        if error != nil {
            print(error!)
            return
        }
        
        // 에러가 발생하지 않았다면 if let 구문으로 들어와 data(옵셔널 데이터)를 언래핑 하게 된다.
        // data는 문자열로 쉽게 출력할 수 있다.
        if let safeData = data {
            // data를 문자열로 출력하는 방법
            // 언래핑한 data를 .utf8 인코딩 방식으로 String 으로 변환
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
