//
//  URL+Ext.swift
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
enum URLError: Error {
    case URLCouldNotBeLocated(forResource: String, withExtension: String?)
}
