//
//  ViewController.swift
//  SwiftyQuiz
//
//  Created by 長沢　遼 on 2016/12/05.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController {
    var cJson:JSON = ["id":1,"name":"a","age":20,"sex":"m"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Test_Btn(_ sender: AnyObject) {
        let dic = [
            "aaa":[
                "aaa",
                "abc",
                "ddff",
                "fffff",
                "aaa"
            ],
            "bbb":[
            ]
        ] as [String : Any]
        
     
//        let json_path:String = Bundle.main.path(forResource: "sample", ofType: "json")!
//            
//            //パスを取得できたら…　JSONデータを文字列で取得
//        let dataFroms = json_path.data(using: String.Encoding.utf8)
//        
//            //JSONデータをパース
//            let jsson = JSON(data: dataFroms!)
//            
//            print(jsson["id"][0].stringValue)
//        
        
        let json = JSON(dic)
        print(json["string"].stringValue) // → Optional(str)
        print(json["array"][0].stringValue) // → Optional(str)
         print(json["aaa"][0].stringValue)
         print(json["aaa"][1].stringValue)
         print(json["aaa"][2].stringValue)
         print(json["aaa"][3].stringValue)
        
        print(json["aaa"].count)
        if(json["aaa"][0].stringValue == json["aaa"][4].stringValue){
            print("sss")
        }

        // → Optional(true)
     
    }
    // 取得したAPIデータの処理
    
  
    @IBAction func ClickBtn(_ sender: AnyObject) {
//        print(cJson)
        let jsonString = "{\"あああ\": 25}"
        let dataFrom = jsonString.data(using: String.Encoding.utf8)
        
         var json = JSON(data: dataFrom!)
        print(json["あああ"])
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

