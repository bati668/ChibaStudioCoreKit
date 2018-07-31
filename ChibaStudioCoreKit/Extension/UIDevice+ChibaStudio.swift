//
//  UIDevice+ChibaStudio.swift
//  ChibaStudioCoreKit
//
//  Created by 千葉大志 on 2018/07/31.
//  Copyright © 2018年 Chiba factory. All rights reserved.
//

import UIKit

public extension UIDevice {
    @nonobjc public static var is_iPhoneX: Bool {
        guard #available(iOS 11.0, *),
            UIDevice().userInterfaceIdiom == .phone else {
                return false
        }
        let nativeSize = UIScreen.main.nativeBounds.size
        let (w, h) = (nativeSize.width, nativeSize.height)
        let (d1, d2): (CGFloat, CGFloat) = (1125.0, 2436.0)
        return (w == d1 && h == d2) || (w == d2 && h == d1)
    }
    
    @nonobjc public static var is4incScreen: Bool {
        guard #available(iOS 11.0, *),
            UIDevice().userInterfaceIdiom == .phone else {
                return false
        }
        let nativeSize = UIScreen.main.nativeBounds.size
        let (w, h) = (nativeSize.width, nativeSize.height)
        let (d1, d2): (CGFloat, CGFloat) = (640.0, 1136.0)
        return (w == d1 && h == d2) || (w == d2 && h == d1)
    }
    
    @nonobjc public static var isUnder4incScreen: Bool {
        guard #available(iOS 11.0, *),
            UIDevice().userInterfaceIdiom == .phone else {
                return false
        }
        let nativeSize = UIScreen.main.nativeBounds.size
        return nativeSize.height <= 1136.0
    }
    
    @nonobjc public static var is_iPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == .pad
    }
    
    @nonobjc public static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    @nonobjc public var platform: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    @nonobjc public static var deviceList: [String: String] {
        return [
            /* iPod Touch 5 */
            "iPod5,1": "iPod Touch 5",
            /* iPod Touch 6 */
            "iPod7,1": "iPod Touch 6",
            
            /* iPhone 4 */
            "iPhone3,1": "iPhone 4",
            "iPhone3,2": "iPhone 4",
            "iPhone3,3": "iPhone 4",
            /* iPhone 4S */
            "iPhone4,1": "iPhone 4S",
            /* iPhone 5 */
            "iPhone5,1": "iPhone 5",
            "iPhone5,2": "iPhone 5",
            /* iPhone 5C */
            "iPhone5,3": "iPhone 5C",
            "iPhone5,4": "iPhone 5C",
            /* iPhone 5S */
            "iPhone6,1": "iPhone 5S",
            "iPhone6,2": "iPhone 5S",
            /* iPhone 6 */
            "iPhone7,2": "iPhone 6",
            /* iPhone 6 Plus */
            "iPhone7,1": "iPhone 6 Plus",
            /* iPhone 6S */
            "iPhone8,1": "iPhone 6S",
            /* iPhone 6S Plus */
            "iPhone8,2": "iPhone 6S Plus",
            /* iPhone SE */
            "iPhone8,4": "iPhone SE",
            /* iPhone 7 */
            "iPhone9,1": "iPhone 7",
            "iPhone9,3": "iPhone 7",
            /* iPhone 7 Plus */
            "iPhone9,2": "iPhone 7 Plus",
            "iPhone9,4": "iPhone 7 Plus",
            
            /* iPad 2 */
            "iPad2,1": "iPad 2",
            "iPad2,2": "iPad 2",
            "iPad2,3": "iPad 2",
            "iPad2,4": "iPad 2",
            /* iPad 3 */
            "iPad3,1": "iPad 3",
            "iPad3,2": "iPad 3",
            "iPad3,3": "iPad 3",
            /* iPad 4 */
            "iPad3,4": "iPad 4",
            "iPad3,5": "iPad 4",
            "iPad3,6": "iPad 4",
            /* iPad Air */
            "iPad4,1": "iPad Air",
            "iPad4,2": "iPad Air",
            "iPad4,3": "iPad Air",
            /* iPad Air 2 */
            "iPad5,3": "iPad Air 2",
            "iPad5,4": "iPad Air 2",
            /* iPad Mini */
            "iPad2,5": "iPad Mini",
            "iPad2,6": "iPad Mini",
            "iPad2,7": "iPad Mini",
            /* iPad Mini 2 */
            "iPad4,4": "iPad Mini 2",
            "iPad4,5": "iPad Mini 2",
            "iPad4,6": "iPad Mini 2",
            /* iPad Mini 3 */
            "iPad4,7": "iPad Mini 3",
            "iPad4,8": "iPad Mini 3",
            "iPad4,9": "iPad Mini 3",
            /* iPad Mini 4 */
            "iPad5,1": "iPad Mini 4",
            "iPad5,2": "iPad Mini 4",
            /* iPad Pro */
            "iPad6,7": "iPad Pro",
            "iPad6,8": "iPad Pro",
            /* Simulator */
            "x86_64": "Simulator",
            "i386": "Simulator"
        ]
    }
    
    @nonobjc public var modelName: String {
        let identifier = platform
        return UIDevice.deviceList[identifier] ?? identifier
    }
}
