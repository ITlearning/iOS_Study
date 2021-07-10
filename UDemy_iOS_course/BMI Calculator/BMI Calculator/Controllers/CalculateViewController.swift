//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var value = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderMove(_ sender: UISlider) {
        let val = String(format: "%.2f", sender.value)
        heightLabel.text = "\(val)m"
    }
    
    
    @IBAction func weigthSliderMove(_ sender: UISlider) {
        let val = String(format: "%.0f", sender.value)
        weightLabel.text = "\(val)Kg"
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        // pow 거듭제곱 기능
        let bmi = weight / pow(height, 2)
        value = String(format: "%.1f", bmi)
        // 스토리보드에서 지정해놓은 segue의 이름을 입력하면
        // 연결된 고유의 이름을 찾아 이동을 하는 역할을 해준다.
        // sender는 어디서 이동을 하는지에 대한 질문인데,
        // 이 코드의 경우 현재 swift 파일에서 움직이는 것이니 self를 입력해줬다.
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // View가 많아질경우 원하는 뷰를 선택할 수 있게 조건문을 넣어줘야 한다.
        if segue.identifier == "goToResult" {
            // as! 를 넣지 않았을 경우엔, 현재 destinationVC가 가리키는 곳은 UIViewController이다.
            // 하지만 우리가 원하는 것은 ResultViewController에 있는 bmiValue 값을 변경하는 것이다.
            // 이렇게 할 경우 원하는 값에 도달하지 못하게 된다.
            // 이럴때 as! ResultViewController 를 입력하면 가리키는 곳이 바뀌어 우리가 원하는 값에 도달할 수 있게 된다.
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = value
        }
    }
}

