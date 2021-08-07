//
//  ViewController.swift
//  WeatherAppClone
//
//  Created by IT learning on 2021/08/07.
//

import UIKit
import Gradients
import Pastel

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var helloLayer: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var introduceAppText: UILabel!
    @IBOutlet weak var touchLabel: UILabel!
    //MARK: - 테이블 뷰 인덱스
    let data = ["오늘 확진자 보기", "전체 확진자 보기", "백신 정보", "백신 접종 병원 찾기", "현재 날씨 보기", "집에 가고 싶다", "안녕하세요"]
    let loadImage = [UIImage(systemName: "person.fill.viewfinder"), UIImage(systemName:"viewfinder.circle"), UIImage(systemName:"pills"), UIImage(systemName:"cross"), UIImage(systemName: "cloud.moon.rain"), UIImage(systemName: "house"), UIImage(systemName: "hands.clap")]
    let textData = ["오늘은 몇명인지 알려줄게요!", "국내 전체 확진자 수는?", "백신을 맞더라도 알고 맞아야겠죠?", "가까운 병원이 어디에 있는지 알려줄게요!", "우리 동네 날씨는 어떠할까요?", "저도 집에 가고 싶네요..", "네! 안녕하세요!"]
    //MARK: - 앱 메인 뷰 구현 코드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background()

        settingLayer()
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.contentInset = UIEdgeInsets(top: 195, left: 0, bottom: 0, right: 0)
        self.introduceAppText.numberOfLines = 0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("tap")
    }
    
    //MARK: - 테이블 뷰 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.cellImage.image = loadImage[indexPath.row]
        cell.cellLabel.text = textData[indexPath.row]
        cell.cellName.text = data[indexPath.row]
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            if scrollView.contentOffset.y < 185 {
                topConstraint.constant = -scrollView.contentOffset.y
                print((185 - scrollView.contentOffset.y) / 185)
                touchLabel.alpha = (185 - scrollView.contentOffset.y) / 185
                helloLayer.alpha = (185 - scrollView.contentOffset.y) / 185
                introduceAppText.alpha = (185 - scrollView.contentOffset.y) / 185
            } else {
                topConstraint.constant = -185
            }
        } else {
            topConstraint.constant = 0
        }
    }
    //MARK: - 그라데이션 배경화면 설정
    func background() {
        let pastelView = PastelView(frame: backgroundView.bounds)
//        backgroundView.layer.shadowColor = UIColor.black.cgColor
//        backgroundView.layer.masksToBounds = false
//        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        backgroundView.layer.shadowRadius = 2
//        backgroundView.layer.shadowOpacity = 0.2
        // 커스텀 방향
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // 커스텀 속도
        pastelView.animationDuration = 3.0
        
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        // 상태바 글씨 흰색으로 변경
        UIApplication.shared.statusBarStyle = .lightContent
        backgroundView.insertSubview(pastelView, at: 0)
    }
    //MARK: - 메인 뷰 텍스트 색, 투명도 설정
    func settingLayer() {
        helloLayer.textColor = .white
        introduceAppText.textColor = .white
        touchLabel.textColor = .white
        touchLabel.alpha = 0.8
        
    }
}
