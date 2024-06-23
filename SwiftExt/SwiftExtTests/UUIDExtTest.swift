//
//  UUIDExtTest.swift
//
//
//  Created by Gustavo Halperin on 21/11/2023.
//

import XCTest

final class UUIDExtTest: XCTestCase {
    func testUUIDNumbersOnly() {
        // Given
        let uuid = UUID()

        // When
        let numbersOnly = uuid.uuidNumbersOnly

        // Then
        XCTAssertEqual(numbersOnly.count, 32, "UUID should contain 32 characters after removing hyphens")
        XCTAssertFalse(numbersOnly.contains("-"), "UUID should not contain hyphens")
        XCTAssertTrue(numbersOnly.allSatisfy { $0.isHexDigit }, "UUID should only contain hexadecimal characters")
    }
}
