//
//  UIColor+ChibaStudio.swift
//  ChibaStudioCoreKit
//
//  Created by 千葉大志 on 2018/07/31.
//  Copyright © 2018年 Chiba factory. All rights reserved.
//

import UIKit

public extension UIColor {
    private static func colorWithDecimal(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return colorWithDecimal(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    public static func colorWithDecimal(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    public static func colorWithHex(color24: NSInteger) -> UIColor {
        let r: Int = (color24 >> 16)
        let g: Int = (color24 >> 8 & 0xFF)
        let b: Int = (color24 & 0xFF)
        return colorWithDecimal(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
    }
    
    public static func colorWithHex(color24: Int, alpha: CGFloat) -> UIColor {
        let r: Int = (color24 >> 16)
        let g: Int = (color24 >> 8 & 0xFF)
        let b: Int = (color24 & 0xFF)
        return colorWithDecimal(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
    }
}
