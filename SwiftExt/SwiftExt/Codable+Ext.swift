//
//  Encodable+Ext.swift
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
extension Encodable {
    var dictionary: Any {
        get throws {
            let jsonData = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            
        }
    }
}

