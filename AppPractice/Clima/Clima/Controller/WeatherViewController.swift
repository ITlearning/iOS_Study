//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TextField에서 일어나는 것들에 대해 위 클래스 자신에게 상황을 알려주는 것이다.
        // TextField에서 알림을 받는 컨트롤러는 뷰 컨트롤러를 대리자로 설정하는 것이다.
        // self는 ViewController를 가리킨다/
        searchTextField.delegate = self
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        // 검색 버튼을 누르면 endEditing 되게끔
        // 그러면 키보드가 내려감
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        
    }
    
    // TextField에서 Return 버튼을 눌렀을 경우(여기선 Go버튼)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    // 그냥 EndEditing과 ShouldEndEditing은 역할이 약간 다르다.
    // Should는 Delegate에게 물어보는거다. 이거 닫아도 괜찮냐 아니냐. 정도?
    // 아래의 EndEditing은 그냥 닫는다. 그리고 통보한다. 약간 다르다.
    
    // 그리고 위에서는 searchTextField로 사용했는데, 이 메서드에서는
    // textField로 사용한다. 그 이유는, 위의 delegate = self
    // 에서 searchTextField 의 식별자를 전달해주기때문에, 자연스레 사용이 가능하다.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // TextField 에서 편집을 중지하였을때(그러니까 입력 다 마쳤을때)
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 아래에 지워지기 전에 도시 이름을 사용하고 싶음
        // searchTextField.text 가 옵셔널 스트링이니까, 사용하려면 언래핑 해야 한다.
        // 따라서 if let 구문을 사용했다.
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
            
        }
        
        // 입력이 끝났을 때 현재 입력했던것은 자연스레 지움
        searchTextField.text = ""
    }
}

