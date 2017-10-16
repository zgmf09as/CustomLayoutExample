//
//  ViewController.swift
//  CustomLayout
//
//  Created by monk773 on 2017. 10. 16..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    var clickCount: Int = 0     //버튼 토글 기능 사용 변수
    
    //    @IBOutlet과 비슷한 역할
    var btn: UIButton!
    var paramEmail: UITextField! // email text field
    var paramUpdate: UISwitch!  // switch instance
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel! // stepper value display
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btn = UIButton(type: UIButtonType.system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트버튼", for: UIControlState.normal)
        btn.center = CGPoint(x: self.view.frame.size.width/2 , y: self.view.frame.size.height/2) //중앙배치
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
//        영역 및 위치 선정은 맨 마지막이 기준이 된다.
        
        self.navigationItem.title = "설정"
        
        // 각종 UI 프로그래밍 방식으로 표현하기 예제 코드
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 80, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblEmail)
        
        //        폰트 정보 얻기.
        //        lblEmail.font = UIFont(name: "Chalkboard SE", size: 14)
        //        for f in UIFont.familyNames {
        //            print("\(f)")
        //        }
        //
        //        let fonts = UIFont.fontNames(forFamilyName: "Menlo")
        //        //실제 폰트 명
        //        for f in fonts {
        //            print("\(f)")
        //        }
        
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 80, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 80, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 125, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextBorderStyle.roundedRect
        self.paramEmail.autocapitalizationType = .none
        self.view.addSubview(self.paramEmail)
        
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 125, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.view.addSubview(self.paramUpdate)
        
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 125, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.view.addSubview(self.paramInterval)
        
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 240, y: 150, width: 100, height: 30)
        self.txtUpdate.text = "갱신함"
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.view.addSubview(self.txtUpdate)
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 240, y: 200, width: 100, height: 30)
        self.txtInterval.text = "0분마다"
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = appDelegate.Common?.UIColorFromRGB(rgbValue: 0xFF0000)
        self.view.addSubview(txtInterval)
        
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    
    @objc func submit(_ sender: Any) {
        
        // 프로그래밍 방식으로 다음 화면으로 넘기는 방법
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\( Int(sender.value) ) 분마다")
    }
    
    @objc func btnOnClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            
            clickCount += 1
            
            if (clickCount % 2) == 0 {
                btn.setTitle("테스트버튼", for: UIControlState.normal)
            } else
            {
                btn.setTitle("클릭 되었습니다.", for: UIControlState.normal)
            }
        }
    }
}

