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
     A circular shift of all bits by n positions.
     - parameter positions: The number of positions to shift.
     - returns: The result of the circular shift operation.
     */
    internal func rotate(by positions: Int) -> Int {
        return ((self << positions) & 0xFFFFFFFF) | (self >> (32 - positions))
    }
    
    /**
     Converts a hexadecimal value to a string.
     - parameter int: The integer being converted.
     - returns: The string value of the given integer.
     */
    internal func toString() -> String {
        var string = ""
        
        for i in (0...7).reversed() {
            let temp = (self >> (i * 4)) & 0x0f
            string += String(format: "%2X", temp).lowercased().replacingOccurrences(of: " ", with: "")
        }
        
        return string
    }
}
