//
//  CollectionExtTest.swift
//
//  Created by Gustavo Halperin on 28/11/2023.
//

import XCTest

final class CollectionExtTest: XCTestCase {

    func testPercentEncoded() {
        // Given
        let dictionary: [String: Any] = [
            "key1": "value1",
            "key2": 123,
            "key3": true
        ]

        // When
        let percentEncodedData = dictionary.percentEncoded()

        // Then
        XCTAssertNotNil(percentEncodedData, "Percent encoded data should not be nil")

        if let data = percentEncodedData,
           let queryString = String(data: data, encoding: .utf8)
        {
            XCTAssertEqual(queryString.split(separator: "&").sorted().joined(separator: "&"), "key1=value1&key2=123&key3=true", "Generated query string is incorrect")
        } else {
            XCTFail("Failed to generate query string")
        }
    }
}
