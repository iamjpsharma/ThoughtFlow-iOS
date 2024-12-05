//
//  DateFormatterUtils.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//

import Foundation

public struct DateFormatterUtils {
    
    // basic date formatting
    public static let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    // Utility method to format date relative to current date
    public static func relativeDateString(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        // Check if the date is within the same day
        if calendar.isDateInToday(date) {
            let components = calendar.dateComponents([.hour, .minute], from: date, to: now)
            
            if let minute = components.minute, minute < 60 {
                return "\(minute) min ago"
            }
            if let hour = components.hour, hour < 24 {
                return "\(hour) hour\(hour > 1 ? "s" : "") ago"
            }
        }
        
        // Check if the date is from yesterday
        if calendar.isDateInYesterday(date) {
            return "Yesterday"
        }
        
        // Check if the date is within this week
        if calendar.isDate(date, equalTo: now, toGranularity: .weekOfYear) {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE" // Full weekday name (e.g. "Thursday")
            return formatter.string(from: date)
        }
        
        // If the date is from the current year
        let formatter = DateFormatter()
        if calendar.isDate(date, equalTo: now, toGranularity: .year) {
            formatter.dateFormat = "MMM d" // Month Day (e.g. "Dec 6")
            return formatter.string(from: date)
        }
        
        // If the date is from a previous year
        formatter.dateFormat = "yyyy MMM d" // Year Month Day (e.g. "2023 Dec 6")
        return formatter.string(from: date)
    }
    
    // Utility to get a formatted string for a full date
    public static func fullDateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
