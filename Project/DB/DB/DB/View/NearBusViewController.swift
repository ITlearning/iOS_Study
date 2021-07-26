//
//  NearBusViewController.swift
//  DB
//
//  Created by IT learning on 2021/07/23.
//

import SwiftUI



class NearBusViewController: UIViewController {
    
    struct Result: Codable {
        var count: Int
        //var station: Station
    }
    /*
    struct Station : Codable {
        var stationID: String
        var stationName: String
    }
    */
    var x: Double = 0.0
    var y: Double = 0.0
    @IBOutlet weak var showX: UILabel!
    @IBOutlet weak var showY: UILabel!
    @IBOutlet weak var loadAPI: UILabel!
    @IBOutlet weak var resultView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadAPI.text = "0HBOY+1Uq+ZWBuWHdW0izA"
        
        ODsayService.sharedInst().setApiKey(self.loadAPI.text)
        ODsayService.sharedInst().setTimeout(10000)
        showX.text = String(format: "-%f", x)
        showY.text = String(format: "%f", y)
        ODsayService.sharedInst().requestPointSearch(abs(Float(x)), y: Float(y), radius: 500, stationClass: "1") { (retCode:Int32, resultDic:[AnyHashable : Any]?) in
            if retCode == 200 {
                
                self.resultView.text = self.mDictToTextJson(rMDic:resultDic)
            } else {
                self.displayErrorPopup(rMDic: resultDic)
            }
        }
        
        
    }
    
    func mDictToTextJson(rMDic:[AnyHashable : Any]?) -> String {
        
        if let sText = rMDic?.description {
            if let bytes = sText.cString(using: String.Encoding.ascii) {
                
                let str = String(cString: bytes, encoding: String.Encoding.nonLossyASCII)!
                
                let decoder = JSONDecoder()
                
                let secondUser = try decoder.decode(Result.self, from: )
                print(secondUser)
                return str
            } else {
                return "No Data is Displayed"
            }
        } else {
            return "No Data is Displayed"
        }
    }
    
    func displayErrorPopup(rMDic:[AnyHashable : Any]?) -> Void {
        self.resultView.text = self.mDictToTextJson(rMDic:rMDic)
        if let errArray = rMDic?["error"] as! [AnyObject]? {
            if let errDic = errArray[0] as? [String: AnyObject] {
                let alertController = UIAlertController(title: errDic["code"] as? String, message: errDic["message"] as? String, preferredStyle: .alert)
                let button0 = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertController.addAction(button0)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
}
