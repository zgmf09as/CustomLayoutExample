//
//  Common.swift
//  CustomLayoutExample
//
//  Created by monk773 on 2017. 10. 16..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

//공통 함수 모음 클래스
class CommonModel {
    
    //UIColor 헥사값 사용 함수
    //ex) UIColorFromRGB(#FFFFFF)
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat = 1.0) ->UIColor {
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16 ) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8 ) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
