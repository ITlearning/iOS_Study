//
//  parsingData.swift
//  DB
//
//  Created by IT learning on 2021/07/23.
//

import Foundation


struct result: Codable {
    var count: Int
    var station: Station
}

struct Station : Codable {
    var stationID: String
    var stationName: String
}
