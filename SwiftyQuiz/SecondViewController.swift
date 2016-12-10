//
//  SecondViewController.swift
//  SwiftyQuiz
//
//  Created by 長沢　遼 on 2016/12/09.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import UIKit
import SwiftyJSON

class SecondViewController: UIViewController {
    
    // NSTimeInterval：時間を計算するメソッド
    var startTime = TimeInterval()
    
    // NSTimer：タイマーを管理するクラス
    var timer:Timer = Timer()

    @IBOutlet weak var first_Btn: UIButton!
    @IBOutlet weak var second_Btn: UIButton!
    @IBOutlet weak var third_Btn: UIButton!
    @IBOutlet weak var times: UILabel!
    @IBOutlet weak var title_Label: UILabel!
    var change_Data = 0
    let quiz = [
        "title":"title",
        "Quiz":["aa",
                "bb",
                "cc",
                "dd",
                "ee"
                ],
        "Ans_a":["0",
                 "1",
                 "2",
                 "3",
                 "4"
                ],
        "Ans_b":["1",
                 "2",
                 "3",
                 "4",
                 "5"
        ],
        "Ans_c":["2",
                 "3",
                 "4",
                 "5",
                 "6"
        ],
        "Quiz_ans":["1",
                "2",
                "3",
                "4",
                "5"
        ],
        
        
] as [String : Any]
    
            override
    func viewDidLoad() {
        super.viewDidLoad()
                 let json = JSON(quiz)
                title_Label.text = json["title"].stringValue
                print(json["Quiz"].count)
                
        // Do any additional setup after loading the view.
    }
    func startingtime(){
        
        if (!timer.isValid) {
            
            // NSTimer：タイマーを管理するクラス
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,                                   // 時間の間隔〔0.01〕
                target: self,                           // タイマーの実際の処理の場所
                selector: #selector(SecondViewController.StartTime),        // メソッド タイマーの実際の処理
                userInfo: nil,
                repeats: true)                          // 繰り返し
            
            // NSDate：日付と時間を管理するクラス
            startTime = NSDate.timeIntervalSinceReferenceDate
        }
    }
    func stop_timer(){
        timer.invalidate()

    }
    @IBAction func Quiz_Start(_ sender: AnyObject) {
//        let json = JSON(quiz)
//
//        first_Btn.setTitle(json["Ans_a"][0].stringValue
//,  for: UIControlState.normal)
//        second_Btn.setTitle(json["Ans_b"][0].stringValue
//            ,  for: UIControlState.normal)
//        third_Btn.setTitle(json["Ans_c"][0].stringValue
//            ,  for: UIControlState.normal)
//        
//       
        startingtime()
        changeJson()
      // Optional("4 hours")
       
          }
    @IBAction func first_Click(_ sender: AnyObject) {
        stop_timer()
        change_Data = change_Data + 1
        changeJson()
        
        
    }

    @IBAction func second_Click(_ sender: AnyObject) {
        stop_timer()
        change_Data = change_Data + 1
        changeJson()
        
    }
    @IBAction func third_Click(_ sender: AnyObject) {
        stop_timer()
        change_Data = change_Data + 1
        changeJson()

    }

    func nowTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        return format.string(from: NSDate() as Date)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func StartTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        
        // 現在の時間を調べるためにスタートします
        var Time: TimeInterval = currentTime - startTime
        
        //〔分〕を計算
        // UInt8：8 ビット符号なし整数への変換
        // NSTimeInterval：引数に時間の長さを示す値
        let minutes = UInt8(Time / 60.0)
        Time -= (TimeInterval(minutes) * 60)
        
        //〔秒〕を計算
//        let seconds = UInt8(Time)
         let seconds = UInt16(Time)
        Time -= TimeInterval(seconds)
        
        //〔ミリ秒〕を計算
        let fraction = UInt8(Time * 100)
        
        //〔分〕〔秒〕〔ミリ秒〕を文字列にします
        let timeMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let timeSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let timeFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
//         時間表示用のラベルに〔分〕〔秒〕〔ミリ秒〕を表示
        times.text  = "\(timeMinutes):\(timeSeconds):\(timeFraction)"
//              times.text  = "\(timeSeconds):\(timeFraction)"
//        times.text  =  String(seconds)
        print(seconds)
        }
    
    func changeJson(){
        let json = JSON(quiz)
        
        if((change_Data) == json["Quiz"].count){
            
            
            
         
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "tttt") as! UINavigationController
            self.present(nextView, animated: true, completion: nil)
        }else{
        
        if(change_Data == json["Quiz"].count){
            timer.invalidate()
        }else{
        first_Btn.setTitle(json["Ans_a"][change_Data].stringValue
            ,  for: UIControlState.normal)
        second_Btn.setTitle(json["Ans_b"][change_Data].stringValue
            ,  for: UIControlState.normal)
        third_Btn.setTitle(json["Ans_c"][change_Data].stringValue
            ,  for: UIControlState.normal)
            
            startingtime()
            }
        
    }


        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


