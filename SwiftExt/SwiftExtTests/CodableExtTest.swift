//
//  CodableExtTest.swift
//
//
//  Created by Gustavo Halperin on 21/11/2023.
//

import XCTest

final class CodableExtTest: XCTestCase {
    struct TestStruct: Codable {
        let name: String
        let age: Int
    }

    func testDictionaryConversion() {
        // Given
        let testObject = TestStruct(name: "Mohamed", age: 27)

        // When
        var result: Any?
        do {
            result = try testObject.dictionary
        } catch {
            XCTFail("Failed to convert object to dictionary: \(error)")
        }

        // Then
        XCTAssertNotNil(result, "Dictionary should not be nil")
        XCTAssertTrue(result is [String: Any], "Result should be a dictionary")
        if let dictionaryResult = result as? [String: Any] {
            XCTAssertEqual(dictionaryResult["name"] as? String, "Mohamed", "Name in dictionary should match")
            XCTAssertEqual(dictionaryResult["age"] as? Int, 27, "Age in dictionary should match")
        }
    }
}
