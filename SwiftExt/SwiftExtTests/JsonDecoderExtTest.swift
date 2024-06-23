//
//  JsonDecoderExtTest.swift
//
//
//  Created by Gustavo Halperin on 21/11/2023.
//

@testable import SwiftExt
import XCTest

final class JsonDecoderExtTest: XCTestCase {
    func testJSONDecoderDateFormatters() {
        // Given
        let dateFormatter1 = DateFormatter.upToSeconds
        let dateFormatter2 = DateFormatter.upToMilli
        let dateFormatter3 = DateFormatter.upToMicro
        let dateFormatters = [dateFormatter1, dateFormatter2, dateFormatter3]
        let jsonDecoder = JSONDecoder(dateFormatters: dateFormatters)
        let dateString = "2023-11-28T15:30:00.123456Z"

        // When
        var decodedDate: Date?
        do {
            decodedDate = try jsonDecoder.decode(Date.self, from: "\"\(dateString)\"".data(using: .utf8)!)
        } catch {
            // Then
            XCTFail("Unexpected error: \(error)")
        }

        // Then
        XCTAssertNotNil(decodedDate)
    }
}
