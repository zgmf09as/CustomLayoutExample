//
//  CusTabBarViewController.swift
//  CustomLayoutExample
//
//  Created by monk773 on 2017. 10. 17..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class CusTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 이 코드가 first,second,third viewController에서 하지 않고 여기서 구성하는 이유는
        // 탭바는 해당 탭을 눌렀을때 viewDidLoad를 호출하기 때문에 첫번째 탭을 제외하고 나머지 탭은 한번 눌러야지만
        // viewDidLoad가 호출된다. 따라서 TabBarController가 호출될떄 아래 내용을 먼저 적용한다.
        if let tbItems = self.tabBar.items {
            let strTitleArray = ["Calendar","File","Photo"]
            
            // 기본적으로 탭바 이이템 객체는 아이콘 이미지의 원본 색상을 지원하지 않는다. 따라서 원본을 사용하려면 랜더링 모드를 변경해주어야한다.
//            let strImageArray = ["calendar","file-tree","photo"]
//
//            for index in 0..<tbItems.count {
//                tbItems[index].image = UIImage(named: strImageArray[index])
//                tbItems[index].title = strTitleArray[index]
//            }
            
            let strImageArray = ["designbump","rss","facebook"]
            
            for index in 0..<tbItems.count {
                let tbItem = tbItems[index]
                tbItem.image = UIImage(named: strImageArray[index])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                tbItem.selectedImage = UIImage(named: "checkmark")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal) //선택시 이미지 변경
                tbItem.title = strTitleArray[index]
                tbItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.gray], for: .disabled)
                tbItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.red], for: .selected)
                tbItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.systemFont(ofSize: 13)], for: .normal)
            }
        }
        
        //활성화된 탭 바에 배경 이미지를 설정
        self.tabBar.tintColor = UIColor.white
        
        //탭 바에 배경 이미지를 설정
        self.tabBar.backgroundImage = UIImage(named:"menubar-bg-mini")
        
        
        // 1. 신축성 옵션 없는 경우 (일반적으로 옵션 주지 않은 경우)
        //self.tabBar.backgroundImage = UIImage(named: "connectivity-bar")
        
        // 2. 신축성 옵션 있는 경우
        // 해당 x,y 값을 기준으로 좌측, 아래가 늘어나는 구조
        // 전체적으로 이미지를 균일하게 늘리는 경우 전부 0으로 설정
        //let bg = UIImage(named: "connectivity-bar")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16)
        //self.tabBar.backgroundImage = bg
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
