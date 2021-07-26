//
//  NearBusViewController.swift
//  DB
//
//  Created by IT learning on 2021/07/23.
//

import SwiftUI
import CoreLocation

class NearBusViewController: UIViewController{
    
    
    @IBOutlet weak var oneBusStop: UILabel!
    @IBOutlet weak var twoBusStop: UILabel!
    @IBOutlet weak var threeBusStop: UILabel!
    @IBOutlet weak var fourBusStop: UILabel!
    @IBOutlet weak var fiveBusStop: UILabel!
    @IBOutlet weak var oneDistance: UILabel!
    @IBOutlet weak var twoDistance: UILabel!
    @IBOutlet weak var threeDistance: UILabel!
    @IBOutlet weak var fourDistance: UILabel!
    @IBOutlet weak var fiveDistance: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nearBusCount: UILabel!
    var x: Double = 0.0
    var y: Double = 0.0
    var name: [String] = []
    var distance: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBusStop()
    }
    
    func searchBusStop() {
        let loadAPI = "0HBOY+1Uq+ZWBuWHdW0izA"
        
        ODsayService.sharedInst().setApiKey(loadAPI)
        ODsayService.sharedInst().setTimeout(10000)
        ODsayService.sharedInst().requestPointSearch(abs(Float(x)), y: Float(y), radius: 750, stationClass: "1") { (retCode:Int32, resultDic:[AnyHashable : Any]!) in
            if retCode == 200 {
                
                // 버스정류장 이름 출력 코드 부분
                let arr = resultDic["result"] as? [String:Any]
                let a = arr?["station"] as? [[String:Any]]
                let count = arr?["count"] as? Int
                // 위 코드까지는 탐색된 구간의 이름, 개수
                self.nearBusCount.text = String(format:"%d",count!)+"개"
                // 아래는 현 위치 좌표
                let coord0 = CLLocation(latitude: self.x, longitude: self.y)
                for i in 0...count!-1 {
                    print(a![i]["stationName"] ?? "None")
                    let n = a![i]["stationName"] as! String
                    self.name.append(n)
                    // 리스트로 찾은 가장 가까운 거리의 좌표 구하기
                    let coord1 = CLLocation(latitude: a![i]["x"] as! CLLocationDegrees, longitude: a![i]["y"] as! CLLocationDegrees)
                    let meter = coord0.distance(from: coord1)
                    self.distance.append(String(format: "%.0f",meter))
                    print("떨어진 거리 : \(String(format: "%.0f",meter))M")
                    print()
                }
            } else {
                self.displayErrorPopup(rMDic: resultDic)
            }
        }
    }
    
    func mDictToTextJson(rMDic:[AnyHashable : Any]?) -> String {
        
        if let sText = rMDic?.description {
            if let bytes = sText.cString(using: String.Encoding.ascii) {
                let str = String(cString: bytes, encoding: String.Encoding.nonLossyASCII)!
                return str
            } else {
                return "No Data is Displayed"
            }
        } else {
            return "No Data is Displayed"
        }
    }
    
    func displayErrorPopup(rMDic:[AnyHashable : Any]?) -> Void {
        if let errArray = rMDic?["error"] as! [AnyObject]? {
            if let errDic = errArray[0] as? [String: AnyObject] {
                let alertController = UIAlertController(title: errDic["code"] as? String, message: errDic["message"] as? String, preferredStyle: .alert)
                let button0 = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertController.addAction(button0)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    
    }
    
    func displayBus() {
        for i in 0...4 {
            if i > name.count {
                
            }
        }
    }
}


extension NearBusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    

}
