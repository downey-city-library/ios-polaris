//
//  Int+Extension.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//
// Adapted from: https://gist.github.com/wdg/f7c8c4088030c59f0f45

import Foundation

extension Int {  
    /**
     Converts an integer to a string.
     - parameter int: The integer being converted.
     - returns: The string value of the given integer.
     */
    func toString(_ int: Int) -> String {
        switch int {
        case 2: // Binary
            return String(self, radix: 2, uppercase: false)
            .lowercased()
            .replacingOccurrences(of: " ", with: "")
            
        case 8: // Octal
            return String(self, radix: 8, uppercase: false)
                .lowercased()
                .replacingOccurrences(of: " ", with: "")
            
        case 16: // Hexadecimal
            return String(format: "%2X", self)
                .lowercased()
                .replacingOccurrences(of: " ", with: "")
            
        default: // Other
            return String(self)
        }
    }
}
