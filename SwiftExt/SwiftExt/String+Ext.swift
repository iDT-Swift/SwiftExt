// The Swift Programming Language
// https://docs.swift.org/swift-book

#if os(iOS)
import SwiftUI
#elseif os(macOS)
import Foundation
#endif

public
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

public
extension String {
    var withoutHyphens: String {
        return self.replacingOccurrences(of: "-", with: "")
    }
}

public
extension Substring {
    var string: String { .init(self) }
}

public
extension String {
    @available(iOS 16.0, *)
    var emailIsValid: Bool {
        return self.wholeMatch(of: emailRegex) !=  nil
    }
    
}
