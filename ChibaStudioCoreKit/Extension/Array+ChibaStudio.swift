//
//  Array+ChibaStudio.swift
//  ChibaStudioCoreKit
//
//  Created by 千葉大志 on 2018/07/31.
//  Copyright © 2018年 Chiba factory. All rights reserved.
//

import Foundation

public extension Array {
    public mutating func removeObject<T>(obj: T) where T : Equatable {
        self = self.filter({$0 as? T != obj})
    }
    
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
