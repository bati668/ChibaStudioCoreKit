//
//  Date+ChibaStudio.swift
//  ChibaStudioCoreKit
//
//  Created by 千葉大志 on 2018/07/31.
//  Copyright © 2018年 Chiba factory. All rights reserved.
//

import Foundation

private let SECONDS_IN_MINUTE: Double = 60
private let MINUTES_IN_HOUR: Double   = 60
private let DAYS_IN_WEEK: Double      = 60
private let HOURS_IN_DAY: Double      = 24

public extension Date {
    
    public func timeAgo() -> String {
        let calendar = Calendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let earliest = now < self ? now : self
        let latest = earliest == now ? self : now
        let components = calendar.dateComponents(unitFlags, from: earliest, to: latest)
        
        if components.year! >= 2 {
            return "\(components.year!)" + "years ago"
        } else if components.year! >= 1 {
            return "year ago"
        } else if components.month! >= 2 {
            return "\(components.month!) " + "months ago"
        } else if components.month! >= 1 {
            return "month ago"
        } else if components.weekOfYear! >= 2 {
            return "\(components.weekOfYear!)" + "weeks ago"
        } else if components.weekOfYear! >= 1 {
            return "1 week ago"
        } else if components.day! >= 2 {
            return "\(components.day!)" + "days ago"
        } else if components.day! >= 1 {
            return "１ day ago"
        } else if components.hour! >= 2 {
            return "\(components.hour!)" + "hours ago"
        } else if components.hour! >= 1 {
            return "hour ago"
        } else if components.minute! >= 2 {
            return "\(components.minute!)" + "minutes ago"
        } else if components.minute! >= 1 {
            return "minute ago"
        } else if components.second! >= 3 {
            return "\(components.second!)" + "secounds ago"
        } else {
            return "just now"
        }
    }
}
