//
//  UUID+Ext.swift
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
extension UUID {
    var uuidNumbersOnly: String {
        uuidString /// UUID format: 8-4-4-4-12
            .withoutHyphens
    }
}
