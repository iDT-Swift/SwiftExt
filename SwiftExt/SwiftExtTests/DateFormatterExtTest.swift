//
//  DateFormatterExtTest.swift
//
//
//  Created by Gustavo Halperin on 21/11/2023.
//

@testable import SwiftExt
import XCTest

final class DateFormatterExtTest: XCTestCase {
    func testUpToSeconds() {
        // Given
        let expectedDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let currentDate = Date()
            
        // When
        let dateFormatter = DateFormatter.upToSeconds
        let formattedDate = dateFormatter.string(from: currentDate)
            
        // Expect
        XCTAssertEqual(formattedDate, dateFormatter.string(from: currentDate))
        XCTAssertTrue(validateDateFormat(dateFormat: expectedDateFormat, dateStr: formattedDate))
    }

    func testUpToMilli() {
        // Given
        let expectedDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let currentDate = Date()
            
        // When
        let dateFormatter = DateFormatter.upToMilli
        let formattedDate = dateFormatter.string(from: currentDate)
            
        // Expect
        XCTAssertEqual(formattedDate, dateFormatter.string(from: currentDate))
        XCTAssertTrue(validateDateFormat(dateFormat: expectedDateFormat, dateStr: formattedDate))
    }

    func testUpToMicro() {
        // Given
        let expectedDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let currentDate = Date()
            
        // When
        let dateFormatter = DateFormatter.upToMicro
        let formattedDate = dateFormatter.string(from: currentDate)
            
        // Expect
        XCTAssertEqual(formattedDate, dateFormatter.string(from: currentDate))
        XCTAssertTrue(validateDateFormat(dateFormat: expectedDateFormat, dateStr: formattedDate))
    }
    
    // Helper function to validate date format
    private func validateDateFormat(dateFormat: String, dateStr: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateStr) != nil
    }
}
