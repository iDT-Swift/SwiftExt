//
//  Bundle+Ext.swift
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
extension Bundle {
    func tryURL(forResource: String,
             withExtension: String?) throws -> URL {
        guard let fileURL = url(forResource: forResource,
                                withExtension: withExtension) else {
            throw URLError.URLCouldNotBeLocated(forResource: forResource,
                                                withExtension: withExtension)
        }
        return fileURL
    }
}
