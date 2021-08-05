//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by IT learning on 2021/08/05.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct Constants {
    // static을 사용했기에 더이상 수정이 불가능한 상수로 바뀌었다.
    // let 으로 선언했을경우에는 유형과 연결이 되고, static을 붙인걸로 선언하면 인스턴스와 연결이 된다.
    let test = "test"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
//    func instanceMethod() {
//
//    }
//
//    static func typeMethod() {
//
//    }
}

// 아래 처럼 let으로 선언했을떄는 따로 구조체를 불렀을때 사용이 가능하고,
// static으로 선언했을때는, 그냥 구조체 그 자체로 사용이 가능하다.
//let myConstants = Constants()
// 메서드도 똑같다. 메서드도 let으로 선언시 따로 불렀을때 사용 가능하고,
//myConstants.instanceMethod()
//print(myConstants.test)

// 이렇게 구조체 자체로 사용이 가능한 것은 static으로 선언했을떄 사용이 가능하다.
//print(Constants.loginSegue)
//Constants.typeMethod()
