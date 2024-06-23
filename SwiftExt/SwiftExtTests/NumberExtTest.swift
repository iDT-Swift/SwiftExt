//
//  NumberExtTest.swift
//
//
//  Created by Gustavo Halperin on 21/11/2023.
//

@testable import SwiftExt
import XCTest

final class NumberExtTest: XCTestCase {
    // Test Int Extension
    func testIntExtensions() {
        // Given
        let intValue = 5
            
        // When
        let doubleValue = intValue.double
        let floatValue = intValue.float
        let cgFloatValue = intValue.cgFloat
        
        // Then
        XCTAssertEqual(doubleValue, Double(intValue))
        XCTAssertEqual(floatValue, Float(intValue))
        XCTAssertEqual(cgFloatValue, CGFloat(intValue))
    }
        
    // Test Float Extension
    func testFloatExtensions() {
        // Given
        var floatValue: Float = 5.3
            
        //Then
        /**
         The ulpOfOne property defines the smallest amount by which two floating-point values can differ, which is an appropriate
         accuracy for checking floating-point equality for values that were just converted from one type to another.
         Remember, due to the precision difference between Float and Double, it's essential to use the accuracy parameter when
         writing tests for floating-point numbers.
         */
        //TODO: We need to figured out why is not working
        //XCTAssertEqual(Double(floatValue), floatValue.double, accuracy: Double.ulpOfOne,
        //               "The computed double property should correctly represent the float value as a double.")
        
        //, -Float.infinity, Float.nan, 0, and -0,
        
        XCTAssertEqual(Double(Float.infinity), Float.infinity.double, accuracy: Double.ulpOfOne,
                       "The computed double property should correctly represent the float value as a double.")
        XCTAssertEqual(Double(-Float.infinity), -Float.infinity.double, accuracy: Double.ulpOfOne,
                       "The computed double property should correctly represent the float value as a double.")
        floatValue = 0
        XCTAssertEqual(Double(floatValue), floatValue.double, accuracy: Double.ulpOfOne,
                       "The computed double property should correctly represent the float value as a double.")
        XCTAssertEqual(floatValue.strToDouble, 0)
        
        // Then
        floatValue = 5.3
        XCTAssertEqual(floatValue.int, 5)
        floatValue = 5.3
        XCTAssertEqual(floatValue.intRounded, 5)
        floatValue = 5.3
        XCTAssertEqual(floatValue.strToDouble, 5.3)
        
        
        floatValue = 5
        XCTAssertEqual(floatValue.strToDouble, 5)
        floatValue = 5.0
        XCTAssertEqual(floatValue.strToDouble, 5)
        floatValue = 5.33
        XCTAssertEqual(floatValue.strToDouble, 5.33)
        floatValue = 5.333
        XCTAssertEqual(floatValue.strToDouble, 5.333)
        floatValue = 5.3333
        XCTAssertEqual(floatValue.strToDouble, 5.3333)
    }
        
    // Test Double Extension
    func testDoubleExtensions() {
        // Given
        let doubleValue = 5.8
            
        // When
        let intValue = doubleValue.int
        let intValueRounded = doubleValue.intRounded
        
        // Then
        XCTAssertEqual(intValue, 5)
        XCTAssertEqual(intValueRounded, 6)
    }
}
