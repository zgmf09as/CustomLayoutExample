//
//  NewAppDelegate.swift
//  CustomLayoutExample
//
//  Created by monk773 on 2017. 10. 17..
//  Copyright © 2017년 monk773. All rights reserved.
//
//  앱 델리게이트 역할 학이ㅟ한 기본 요건
//  1. UIResponder 클래스 상속
//  2. UIApplicationDelegate 프로토콜 구현
//  3. @UIApplicationMain 선언 ( 프로젝트 전체에서 한개에만 선언되야한다. )

import UIKit

@UIApplicationMain
class NewAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var Common: CommonModel?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Common = CommonModel()
        
        // 1. 탭바 생성, 배경 흰색
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        // 2. 생성된 탭바를 루트 뷰 컨트롤러로 등록
        self.window?.rootViewController = tbC
        
        // 3. 각 탭 바 아이템에 연결된 뷰 컨트롤러 객체 생성
        let view01 = FirstViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        // 4. 생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록
        tbC.setViewControllers([view01, view02, view03], animated: false)
        
        // 5. 개별 탭 바 아이템 속성 설정
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named:"calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named:"file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named:"photo"), selectedImage: nil)
        
        
        return true
    }
}
