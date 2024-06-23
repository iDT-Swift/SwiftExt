//
//  Number+Ext.swift
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
extension Int {
    var cgFloat: CGFloat { CGFloat(self) }
    var double: Double { Double(self) }
    var float: Float { Float(self) }
}

enum FloatError: Error {
    case accuracyError
}

public
extension Float {
    var int: Int { Int(self) }
    var intRounded: Int { self.rounded(.toNearestOrAwayFromZero).int }
    //IMPORTANT: Conversion to double may have up to Double.ulpOfOne accuracy error
    var double: Double { Double(self) }
    var tryDouble: Double {
        get throws {
            let double = self.double
            guard self.strToDouble == double else {
                throw FloatError.accuracyError
            }
            return double
        }
    }
    var string:String { String(describing: self) }
    //IMPORTANT: This conversion ensure that there is no accuracy error during the conversion
    var strToDouble: Double {
        guard let value = Double(self.string) else {
           assertionFailure("float conversion to double failure")
           return 0
        }
        return value
    }
}

public
extension Double {
    var int: Int { Int(self) }
    var intRounded: Int { self.rounded(.toNearestOrAwayFromZero).int }
}
