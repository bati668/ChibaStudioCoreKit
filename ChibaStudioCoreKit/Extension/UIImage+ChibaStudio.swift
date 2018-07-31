//
//  UIImage+ChibaStudio.swift
//  ChibaStudioCoreKit
//
//  Created by 千葉大志 on 2018/07/31.
//  Copyright © 2018年 Chiba factory. All rights reserved.
//

import Foundation
import CoreGraphics

public extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: (size.width == 0 || size.height == 0) ? CGSize(width: 1, height: 1) : size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    public class func roundedImageWithBorder(fillColor: UIColor,
                                      size: CGSize = CGSize(width: 1, height: 1),
                                      radius: CGFloat,
                                      borderWidth: CGFloat,
                                      borderColor: CGColor) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        imageView.contentMode = .center
        imageView.image = UIImage(color: fillColor, size: size)
        imageView.layer.cornerRadius = radius
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = borderWidth
        imageView.layer.borderColor = borderColor
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    public var data: Data? {
        return UIImageJPEGRepresentation(self, 1.0)
    }
    
    /// Aspect could be changed.
    public func simpleResize(to size: CGSize) -> UIImage {
        if size == .zero { return self }
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else { fatalError() }
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    /// Aspcet will not be changed
    public func resize(to targetSize: CGSize) -> UIImage {
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        return simpleResize(to: newSize)
    }
}
