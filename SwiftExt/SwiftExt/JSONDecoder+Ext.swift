//
//  JSONDecoder+Ext.swift
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
extension JSONDecoder {
    convenience init(dateFormatters: [DateFormatter]) {
        self.init()
        self.dateDecodingStrategy = .custom { decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            for dateFormatter in dateFormatters {
                if let date = dateFormatter.date(from: dateString) { return date }
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
        }
    }
    static let mutliSecondsAccuracy = JSONDecoder(dateFormatters:
                                                    [.upToSeconds,
                                                     .upToMilli,
                                                     .upToMicro] )
}
