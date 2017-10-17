//
//  SecondViewController.swift
//  CustomLayoutExample
//
//  Created by monk773 on 2017. 10. 16..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        title.text = "두 번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        title.sizeToFit() // 콘텐츠 내용에 맞게 레이블 크기 변경, center 속성보다 먼저 실행되야한다.
        
        title.center.x = self.view.frame.width/2
        
        self.view.addSubview(title)
        
    }
}
