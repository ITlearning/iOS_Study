//
//  ViewController.swift
//  DB
//
//  Created by IT learning on 2021/07/21.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var subLocationLabel: UILabel!
    @IBOutlet weak var updateStatus: UILabel!
    var timer: Timer!
    var findLocation = CLLocation(latitude: 36.897700, longitude: 126.646463)
    let geocoder = CLGeocoder()
    let locale = Locale(identifier: "Ko-kr")
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStatus.alpha = 0
        
        locationUp()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerProc), userInfo: nil, repeats: true)
        
        // 위치정보 업데이트
        
    }
        
    
    func locationUp() {
        //MARK: 로케이트된 곳 정보 땡겨오는 코드
        geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
            if let address: [CLPlacemark] = placemarks {
                if let name: String = address.first?.subLocality {self.subLocationLabel.text = name}
                if let subname: String = address.first?.locality {
                    self.locationLabel.text = subname
                }
            }
        })
        
        //MARK: 현재 위치 경도 위도 가져오는 코드
        locationManager.delegate = self
        // 거리 정확도 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        // 아이폰 설정에서의 위치 서비스가 켜졌거나 꺼졌을 경우
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation() // 위치 정보 받아오기 시작
            print(locationManager.location?.coordinate)
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            print("didUpdateLocations")
            if let location = locations.first {
                findLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                print("위도: \(location.coordinate.latitude)")
                print("경도: \(location.coordinate.longitude)")
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
    
    @IBAction func updateLocationButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: ({
            self.updateStatus.alpha = 1;
            self.updateStatus.alpha = 0;
        }))
        self.locationUp()
    }
    
    @objc func timerProc(timer: Timer) {
        let date = Date()
        
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy년MM월dd일"
        let msg = formatter.string(from: date)
        dateLabel.text = msg
        formatter.dateFormat = "a hh:mm"
        let aa = formatter.string(from: date)
        timeLabel.text = aa
    }
    
    
    @IBAction func touchEditButton(_ sender: Any) {
        
    }
}


extension String {
    func stringFromDate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: now)
    }
}


