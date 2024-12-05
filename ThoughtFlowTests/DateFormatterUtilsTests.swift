//
//  DateFormatterUtilsTests.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//

import XCTest
@testable import ThoughtFlow
class DateFormatterUtilsTests: XCTestCase {
    
    func testRelativeDateStringToday() {
        // Given
        let calendar = Calendar.current
        let now = Date()
        
        // When
        let result = DateFormatterUtils.relativeDateString(from: now)
        
        // Then
        XCTAssertEqual(result, "0 min ago")
    }
    
    func testRelativeDateStringYesterday() {
        // Given
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        
        // When
        let result = DateFormatterUtils.relativeDateString(from: yesterday)
        
        // Then
        XCTAssertEqual(result, "Yesterday")
    }
    
    func testRelativeDateStringMinutesAgo() {
        // Given
        let calendar = Calendar.current
        let minutesAgo = calendar.date(byAdding: .minute, value: -10, to: Date())!
        
        // When
        let result = DateFormatterUtils.relativeDateString(from: minutesAgo)
        
        // Then
        XCTAssertEqual(result, "10 min ago")
    }
    
     func testFullDateString() {
        // Given
        let now = Date()
        
        // Get the year from the current date
        let calendar = Calendar.current
        let year = calendar.component(.year, from: now) // Extract the year as an integer
        
        // When
        let result = DateFormatterUtils.fullDateString(from: now)
        
        // Then
        XCTAssertNotNil(result)
        XCTAssertTrue(result.contains(String(year))) // Ensure the year is included in the formatted string
    }

}
