//
//  DateExtensions.swift
//  UsefulFramework
//
//  Created by Alexander Slobodjanjuk on 08.05.2018.
//  Copyright © 2018 Slobodyanyuk Alexander. All rights reserved.
//

import Foundation

public extension Date {

    
    // Date().quarter -> 3 // date in third quarter of the year.
    var quarter: Int {
        let month = Double(Calendar.current.component(.month, from: self))
        let numberOfMonths = Double(Calendar.current.monthSymbols.count)
        let numberOfMonthsInQuarter = numberOfMonths / 4
        return Int(ceil(month/numberOfMonthsInQuarter))
    }
    
    
    // Date().weekOfYear -> 2 // second week in the year.
    var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self) }
    
    
    // Date().weekOfMonth -> 3 // date is in third week of the month.
    var weekOfMonth: Int {
        return Calendar.current.component(.weekOfMonth, from: self) }
    
    
    // Date().year -> 2017
    // var someDate = Date()
    // someDate.year = 2000 // sets someDate's year to 2000
    var year: Int {
        get {
            return Calendar.current.component(.year, from: self)
        }
        set {
            guard newValue > 0 else { return }
            let currentYear = Calendar.current.component(.year, from: self)
            let yearsToAdd = newValue - currentYear
            if let date = Calendar.current.date(byAdding: .year, value: yearsToAdd, to: self) {
                self = date
            }
        }
    }
    
    //     Date().month -> 1
    //     var someDate = Date()
    //     someDate.month = 10 // sets someDate's month to 10.
    var month: Int {
        get {
            return Calendar.current.component(.month, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentMonth = Calendar.current.component(.month, from: self)
            let monthsToAdd = newValue - currentMonth
            if let date = Calendar.current.date(byAdding: .month, value: monthsToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    //     Date().day -> 12
    //     var someDate = Date()
    //     someDate.day = 1 // sets someDate's day of month to 1.
    var day: Int {
        get {
            return Calendar.current.component(.day, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentDay = Calendar.current.component(.day, from: self)
            let daysToAdd = newValue - currentDay
            if let date = Calendar.current.date(byAdding: .day, value: daysToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    //     Date().weekday -> 5 // fifth day in the current week.
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    
    //     Date().hour -> 17 // 5 pm
    //     var someDate = Date()
    //     someDate.hour = 13 // sets someDate's hour to 1 pm.
    var hour: Int {
        get {
            return Calendar.current.component(.hour, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentHour = Calendar.current.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour
            if let date = Calendar.current.date(byAdding: .hour, value: hoursToAdd, to: self) {
                self = date
            }
        }
    }
    

    //     Date().minute -> 39
    //     var someDate = Date()
    //     someDate.minute = 10 // sets someDate's minutes to 10.
    var minute: Int {
        get {
            return Calendar.current.component(.minute, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentMinutes = Calendar.current.component(.minute, from: self)
            let minutesToAdd = newValue - currentMinutes
            if let date = Calendar.current.date(byAdding: .minute, value: minutesToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    //     Date().second -> 55
    //     var someDate = Date()
    //     someDate.second = 15 // sets someDate's seconds to 15.
    var second: Int {
        get {
            return Calendar.current.component(.second, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentSeconds = Calendar.current.component(.second, from: self)
            let secondsToAdd = newValue - currentSeconds
            if let date = Calendar.current.date(byAdding: .second, value: secondsToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    //     Date().nanosecond -> 981379985
    //     var someDate = Date()
    //     someDate.nanosecond = 981379985 // sets someDate's seconds to 981379985.
    var nanosecond: Int {
        get {
            return Calendar.current.component(.nanosecond, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentNanoseconds = Calendar.current.component(.nanosecond, from: self)
            let nanosecondsToAdd = newValue - currentNanoseconds
            
            if let date = Calendar.current.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    //     Date().millisecond -> 68
    //     var someDate = Date()
    //     someDate.millisecond = 68 // sets someDate's nanosecond to 68000000.
    var millisecond: Int {
        get {
            return Calendar.current.component(.nanosecond, from: self) / 1000000
        }
        set {
            let nanoSeconds = newValue * 1000000
            let allowedRange = Calendar.current.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(nanoSeconds) else { return }
            
            if let date = Calendar.current.date(bySetting: .nanosecond, value: nanoSeconds, of: self) {
                self = date
            }
        }
    }

}
