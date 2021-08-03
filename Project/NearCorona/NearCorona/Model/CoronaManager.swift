//
//  CoronaManager.swift
//  NearCorona
//
//  Created by IT learning on 2021/08/01.
//

import Foundation
protocol CoronaMangerDelegate {
    func didFailWithError(error: Error)
    func pushCount(corona: CoronaModel)
    func pushSelectCount(corona: CoronaModel)
}

struct CoronaManager {
    let array = ["korea", "seoul", "busan", "daegu", "incheon", "gwangju", "daejeon", "ulsan"]
    let baseURL = "https://api.corona-19.kr/korea/country/new/?serviceKey=b325a28a690c2d0845bd2066ec8e8b46a"
    var cityName = "korea"
    func fetchStatus() {
        performRequest(with: baseURL)
    }
    mutating func fetchStatus(_ cityName: String) {
        performRequest(with: baseURL)
        self.cityName = cityName
    }
    var delegate: CoronaMangerDelegate?
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, ersponse, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let corona = self.parseJSON(safeData) {
                        if cityName == "korea" {
                            self.delegate?.pushCount(corona: corona)
                        } else {
                            self.delegate?.pushSelectCount(corona: corona)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coronaData: Data) -> CoronaModel? {
        let decoder = JSONDecoder()
        do {
            //let decodedData = try! decoder.decode([coronaData.], from: <#T##Data#>)
            let decodedData = try decoder.decode(CoronaData.self, from: coronaData)
            let cityCase: String?
            let cityTotalCase: String?
            let CN: String?
            switch cityName {
            case "korea":
                cityCase = decodedData.korea.newCase
                cityTotalCase = decodedData.korea.totalCase
                CN = decodedData.korea.countryName
            case "seoul":
                cityCase = decodedData.seoul.newCase
                cityTotalCase = decodedData.seoul.totalCase
                CN = decodedData.seoul.countryName
            case "busan":
                cityCase = decodedData.busan.newCase
                cityTotalCase = decodedData.busan.totalCase
                CN = decodedData.busan.countryName
            case "daegu":
                cityCase = decodedData.daegu.newCase
                cityTotalCase = decodedData.daegu.totalCase
                CN = decodedData.daegu.countryName
            case "incheon":
                cityCase = decodedData.incheon.newCase
                cityTotalCase = decodedData.incheon.totalCase
                CN = decodedData.incheon.countryName
            case "gwangju":
                cityCase = decodedData.gwangju.newCase
                cityTotalCase = decodedData.gwangju.totalCase
                CN = decodedData.gwangju.countryName
            case "daejeon":
                cityCase = decodedData.daejeon.newCase
                cityTotalCase = decodedData.daejeon.totalCase
                CN = decodedData.daejeon.countryName
            default:
                cityCase = decodedData.korea.newCase
                cityTotalCase = decodedData.korea.totalCase
                CN = decodedData.korea.countryName
            }
            let corona = CoronaModel(countryName: CN!, newCase: cityCase!, totalCase: cityTotalCase!)
            return corona
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
