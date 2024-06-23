//
//  DateFormatter+Ext.swift
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
extension DateFormatter {
   convenience init(dateFormat:String) {
        self.init()
        self.dateFormat = dateFormat
    }
    static let upToSeconds = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    static let upToMilli = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    static let upToMicro = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ")
}
