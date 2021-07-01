//
//  ViewController.swift
//  gongbu
//
//  Created by IT learning on 2021/07/01.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    var player: AVAudioPlayer!
    var timer: Timer!
    
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progerssSlider: UISlider!
    
    // 플레이어를 초기화 하는 메소드
    func initializePlayer() {
        
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.progerssSlider.maximumValue = Float(self.player.duration)
        self.progerssSlider.minimumValue = 0
        self.progerssSlider.value = Float(self.player.currentTime)
    }
    
    // 레이블을 매 초마다 업데이트 해줄 메서드
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute,second,milisecond)
        
        self.timeLabel.text = timeText
    }
    
    
    // 타이머를 만들고 그것을 수행해줄 메서드
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {
            [unowned self] (timer: Timer) in
            
            if self.progerssSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progerssSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    
    // 타이머를 해제 해줄 메서드
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
    }


    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton){
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
        
    }
    
    
    @IBAction func SliderValueChanged(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
   
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ plater: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progerssSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
}

