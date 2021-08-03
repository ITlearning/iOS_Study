//
//  CoronaData.swift
//  NearCorona
//
//  Created by IT learning on 2021/08/01.
//

import Foundation

struct CoronaData : Codable {
    var korea: Menu
    var seoul: Menu
    var busan: Menu
    var daegu: Menu
    var incheon: Menu
    var gwangju: Menu
    var daejeon: Menu
    var ulsan: Menu
    var sejong: Menu
    var gyeonggi: Menu
    var gangwon: Menu
    var chungbuk: Menu
    var chungnam: Menu
    var jeonbuk: Menu
    var jeonnam: Menu
    var gyeongbuk: Menu
    var gyeongnam: Menu
    var jeju: Menu
}

struct Menu : Codable {
    let countryName: String
    let newCase: String
    let totalCase: String
}

