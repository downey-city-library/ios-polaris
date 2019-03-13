//
//  String+Extension.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//
// Adapted from: https://gist.github.com/wdg/f7c8c4088030c59f0f45

import Foundation

extension String {
    
    /**
     Get the character code of a character at a given position.
     - parameter character: The position of the desired character.
     - returns: The character code of the character.
     */
    internal func code(for character: Int) -> Int {
        if self.count > character {
            let character = String(self[index(startIndex, offsetBy: character)])
            return Int(String(character.unicodeScalars.first!.value))!
        } else {
            return 0
        }
    }
    
    /**
     The SHA1 hashed value for the string.
     - Returns: SHA1 hashed string
     */
    public var sha1: String {
        get {
            return Encryption.hash(self)
        }
    }
}
