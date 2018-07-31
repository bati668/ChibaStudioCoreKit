//
//  UIScreen+ChibaStudio.swift
//  ChibaStudioCoreKit
//
//  Created by 千葉大志 on 2018/07/31.
//  Copyright © 2018年 Chiba factory. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    @nonobjc public static var is3_5inchDisplay: Bool {
        return main.bounds.size.height == 480
    }
    
    @nonobjc public static var is4inchDisplay: Bool {
        return main.bounds.size.height == 568
    }
    
    @nonobjc public static var is4_7inchDisplay: Bool {
        return main.bounds.size.height == 667
    }
    
    @nonobjc public static var is5_5inchDisplay: Bool {
        return main.bounds.size.height == 736
    }
    
    @nonobjc public static var is5_8inchDisplay: Bool {
        return main.bounds.size.height == 812
    }
    
    @nonobjc public static var isOver4inchDisplay: Bool {
        return main.bounds.size.height >= 568
    }
    
    @nonobjc public static var isOver4_7inchDisplay: Bool {
        return main.bounds.size.height >= 667
    }
    
    @nonobjc public static var isOver5_5inchDisplay: Bool {
        return main.bounds.size.height >= 736
    }
    
    @nonobjc public static var frame: CGRect {
        return main.bounds
    }
    
    @nonobjc public static var center: CGPoint {
        return CGPoint(x: main.bounds.midX, y: main.bounds.midY)
    }
    
    @nonobjc public static var size: CGSize {
        return main.bounds.size
    }
    
    @nonobjc public static var width: CGFloat {
        return main.bounds.size.width
    }
    
    @nonobjc public static var height: CGFloat {
        return main.bounds.size.height
    }
}
