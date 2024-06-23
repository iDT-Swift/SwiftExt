//
//  StringExtTest.swift
//
//
//  Created by Gustavo Halperin on 21/11/2023.
//

@testable import SwiftExt
import XCTest

final class StringExtTest: XCTestCase {
    func testURLQueryValueAllowedDoesNotContainGeneralDelimiters() {
        // Given
        let expectedGeneralDelimiters = ":#[]@"
            
        // When
        let urlQueryValueAllowed = CharacterSet.urlQueryValueAllowed
            
        // Then
        for char in expectedGeneralDelimiters {
            let scalarOptional = UnicodeScalar(String(char))
            do {
                let scalar = try XCTUnwrap(scalarOptional,
                                           "\(char) isn't convertible to UnicodeScalar")
     
                XCTAssertFalse(urlQueryValueAllowed.contains(scalar),
                               "\(char) should not be present in urlQueryValueAllowed")
            }
            catch {
                XCTFail("Failed to unwrap uncode scalar value")
            }
        }
    }
        
    func testURLQueryValueAllowedDoesNotContainSubDelimiters() {
        // Given
        let expectedSubDelimiters = "!$&'()*+,;="
            
        // When
        let urlQueryValueAllowed = CharacterSet.urlQueryValueAllowed
            
        // Then
        for char in expectedSubDelimiters {
            let scalarOptional = UnicodeScalar(String(char))
            do {
                let scalar = try XCTUnwrap(scalarOptional,
                                           "\(char) isn't convertible to UnicodeScalar")
     
                XCTAssertFalse(urlQueryValueAllowed.contains(scalar),
                               "\(char) should not be present in urlQueryValueAllowed")
            }
            catch {
                XCTFail("Failed to unwrap uncode scalar value")
            }
                   
        }
    }

    func testWithoutHyphens() {
        // Given
        let stringWithHyphens = "mohamed-shedeed"
           
        // When
        let stringWithoutHyphens = stringWithHyphens.withoutHyphens
           
        // Then
        XCTAssertEqual(stringWithoutHyphens, "mohamedshedeed")
    }
    
    func testSubstringToStringConversion() {
        // Given
        let originalString = "123456789"
          
        // When
        let subString = originalString[originalString.startIndex...]
        
        // Then
        XCTAssertEqual(subString.string, originalString)
    }
    
    // TODO: Cover more test cases
    func testEmailIsValid() {
        // Given
        let validEmail = "gus@ideastouch.com"
        let invalidEmail = "gus.Et.ideastouch.com"
            
        // When
        let isEmailValid_One = validEmail.emailIsValid
        let isEmailValid_Two = invalidEmail.emailIsValid
        
        // Then
        XCTAssertTrue(isEmailValid_One)
        XCTAssertFalse(isEmailValid_Two)
    }
}
