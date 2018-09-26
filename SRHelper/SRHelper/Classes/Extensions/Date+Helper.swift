//
//  Date+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/19/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//


extension Date {
    
    func shift(days: Int = 0, months: Int = 0, years: Int = 0) -> Date {
        
        var dateComponents = DateComponents()
        
        dateComponents.month = days
        dateComponents.day = months
        dateComponents.year = years
        
        return Calendar.current.date(byAdding: dateComponents, to: self) ?? self
    }
    
    func daysInterval(from date: Date = Date()) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func isToday() -> Bool {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let calendarComponents: NSCalendar.Unit = [.year, .month, .day]
        return (calendar as NSCalendar?)?.components(calendarComponents, from: Date()) == (calendar as NSCalendar?)?.components(calendarComponents, from: self)
    }
    
    public func toString(_ mask:String?) -> String {
        let dateFormatter = DateFormatter()
        if mask != nil {
            dateFormatter.dateFormat = mask
        } else {
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
        }
        
        return dateFormatter.string(from: self)
    }
    
    func isLeapYear() -> Bool {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year], from: self)
        
        guard let year = components.year else { return false }
        return isLeapYear(year)
    }
    
    func isLeapYear(_ year: Int) -> Bool {
        let isLeapYear = ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
        return isLeapYear
    }
    
}
