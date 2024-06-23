//
//  Dictionary+Ext.swift
//
//
//  Created by Gustavo Halperin on 10/10/23.
//

#if os(iOS)
import SwiftUI
#elseif os(macOS)
import Foundation
#endif

public
extension Dictionary {
    func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}
