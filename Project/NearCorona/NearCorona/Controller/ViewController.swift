//
//  ViewController.swift
//  NearCorona
//
//  Created by IT learning on 2021/07/27.
//

import UIKit
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var todayCountLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var selectTxField: UITextField!
    @IBOutlet weak var selectCityCountLabel: UILabel!
    @IBOutlet weak var selectCityTotalLabel: UILabel!
    @IBOutlet weak var CityTextLabel: UILabel!
    @IBOutlet weak var statusTextLabel: UILabel!
    var coronaManager = CoronaManager()
    let pickerView = UIPickerView()
    var selectCity = "" // 선택시 업데이트
    let data = ["seoul", "busan", "daegu", "incheon", "gwangju", "daejeon", "ulsan"]
    override func viewDidLoad() {
        super.viewDidLoad()
        coronaManager.delegate = self
        coronaManager.fetchStatus()
        line()
        selectTxField.tintColor = .clear
        selectTxField.backgroundColor = .gray
        pick()
        
        
        
    }
    
    func line() {
        let lineView1 = UIView(frame: CGRect(x: 37, y: 110, width: 300, height: 1.5))
        lineView1.backgroundColor = UIColor.gray
        let lineView2 = UIView(frame: CGRect(x: 37, y: 225, width: 300, height: 1.5))
        lineView2.backgroundColor = UIColor.gray
        let lineView3 = UIView(frame: CGRect(x: 37, y: 350, width: 300, height: 1.5))
        lineView3.backgroundColor = UIColor.gray
        self.view.addSubview(lineView1)
        self.view.addSubview(lineView2)
        self.view.addSubview(lineView3)
    }

    func pick() {
        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let pickerToolbar : UIToolbar = UIToolbar()
        pickerToolbar.barStyle = .default
        pickerToolbar.isTranslucent = true  // 툴바가 반투명인지 여부 (true-반투명, false-투명)
        pickerToolbar.backgroundColor = .lightGray
        pickerToolbar.sizeToFit()   // 서브뷰만큼 툴바 크기를 맞춤
        // 피커뷰 툴바에 확인/취소 버튼추가
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
        pickerToolbar.setItems([btnCancel , space , btnDone], animated: true)   // 버튼추가
        pickerToolbar.isUserInteractionEnabled = true   // 사용자 클릭 이벤트 전달
        
        selectTxField.inputView = pickerView
        selectTxField.inputAccessoryView = pickerToolbar

    }
    
    
    @objc func onPickDone() {
        selectTxField.text = selectCity
        print(selectCity)
        coronaManager.fetchStatus(selectCity)
        
        selectTxField.resignFirstResponder() // PickerView 내림
        selectCity = ""
        
    }
    
    @objc func onPickCancel() {
        selectTxField.resignFirstResponder()
        selectCity = ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectCity = data[row]
    }
}

extension ViewController: CoronaMangerDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func pushCount(corona: CoronaModel) {
        DispatchQueue.main.async {
            self.todayCountLabel.text = "+"+corona.newCase
            self.totalCountLabel.text = corona.totalCase
            let cnt: Int? = corona.newCase.count
            if let number = cnt {
                switch number {
                case 5..<10:
                    self.statusTextLabel.text = "오늘은 '방콕' 하는게 좋을 것 같아요!"
                case 4..<5:
                    self.statusTextLabel.text = "그래도 안나가는게 좋지 않을까요?"
                case 3..<4:
                    self.statusTextLabel.text = "마스크 잘 쓰고 다니세요!"
                case 1..<3:
                    self.statusTextLabel.text = "그래도 항상 조심하세요!"
                default:
                    self.CityTextLabel.text = "코로나 없는 세상을 살고 싶습니다."
                }
            }
            
        }
    }
    
    func pushSelectCount(corona: CoronaModel) {
        DispatchQueue.main.async {
            self.CityTextLabel.text = corona.countryName
            self.selectCityCountLabel.text = "+"+corona.newCase
            self.selectCityTotalLabel.text = corona.totalCase
        }
        
    }
}


func drop() {
    
}

