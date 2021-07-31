//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
// UIPickerViewDataSource : UIPicker 내에 데이터를 변경할 때 사용하는 Protocol
// UIPickerViewDelegate : UIPicker를 뷰에서 사용할때 사용하는 Delegate
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
    // 구성요소 수 세팅
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 이건 아마도 카테고리 같다.
        // 우린 그냥 각 화폐단위를 보여줄꺼니까 카테고리는 한개
        return 1
    }
    
    let coinManager = CoinManager()
    
    // 얘는 반환을 Int 로 하고
    // Picker에 보여지는 개수를 출력하는 듯 하다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 아마도 코인 개수를 의미하는 듯 하다.
        return coinManager.currencyArray.count
    }
    
    // 얘는 반환을 String으로 한다.
    // Picker에 보여지는 화폐단위를 return한다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 아래 코드는 아마도, 해당 열의 화폐단위를 세팅하는 듯 하다.
        return coinManager.currencyArray[row]
    }
    
    // 선택했을때 해당 인덱스가 반환되는 pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectCurrencyArray = coinManager.currencyArray[row]
        // 선택한 화폐단위의 가치를 가져오는 메서드
        coinManager.getCoinPrice(for: selectCurrencyArray)
    }
}
