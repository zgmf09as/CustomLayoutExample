//
//  ReadViewController.swift
//  CustomLayoutExample
//
//  Created by monk773 on 2017. 10. 16..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class ReadViewController: BaseViewController {

    //ViewController 에서 넘겨준 데이터 저장할 변수
    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = appDelegate.Common?.UIColorFromRGB(rgbValue: 0xFFFFFF) // == UIColor.white
        
        // 1. 인스턴스 생성
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
        
        // 2. 영역 및 위치 설정
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        update.frame = CGRect(x: email.frame.origin.x, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: email.frame.origin.x, y: 200, width: 300, height: 30)
        
        // 3. 속성 설정
        email.text = "전달받은 이메일 : \(self.pEmail!)"
        update.text = "업데이트 여부 : \(self.pUpdate == true ? "업데이트 함" : "업데이트 안 함")"
        interval.text = "업데이트 주기 : \(self.pInterval!)분마다"
        
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)
    }
}
