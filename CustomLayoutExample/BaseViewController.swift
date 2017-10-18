//
//  BaseViewController.swift
//  CustomLayoutExample
//
//  Created by monk773 on 2017. 10. 16..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

// 공통으로 사용할 내용을 가진 컨트롤러
class BaseViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let tabBar = self.tabBarController?.tabBar else {
            return
        }
//        tabBar.isHidden = (tabBar.isHidden == true) ? false : true
//        UIView.animate(withDuration: TimeInterval(0.15)) {
//            tabBar.alpha = ( tabBar.alpha == 0 ? 1 : 0 )
//        }
     
        func exec() {
            tabBar.alpha = ( tabBar.alpha == 0 ? 1 : 0 )
        }
        
        UIView.animate(withDuration: TimeInterval(0.5), animations: exec)
    }
}
