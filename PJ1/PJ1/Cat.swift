//
//  Person.swift
//  PJ1
//
//  Created by IT learning on 2021/05/30.
//

import Foundation

// 함수를 정해주고 딕셔너리로 정보를 저장했다.

struct Cat {
    let name: String
    let age: Int
    let imageURL: String
    let height: Double
    let weight: Double
    let ment: String
}

extension Cat {
    static func all() -> [Cat] {
        
        return [
            Cat(name: "루루", age: 3, imageURL: "루루", height: 16, weight: 2.90, ment: "\"(두 발로 일어서며) 루루애오!\""),
            Cat(name: "티티", age: 5, imageURL: "티티", height: 28, weight: 4.51, ment: "\"나 표정 원래 이래, 알잖아!\""),
            Cat(name: "디디", age: 5, imageURL: "디디", height: 34, weight: 6.02, ment: "\"디디-귀엽다. 디디-빵 줘라.\"")
        ]
    }
}
