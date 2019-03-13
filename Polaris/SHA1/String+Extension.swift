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
    func charCodeAt(_ charIndex: Int) -> Int {
        if (self.count > charIndex) {
            let character = String(self[index(startIndex, offsetBy: charIndex)])
            return Int(String(character.unicodeScalars.first!.value))!
        } else {
            return 0
        }
    }
    
    /**
     Make a sha1 Hash for the string.
     - Returns: sha1 hashed string
     */
    public var sha1: String {
        get {
            return Encryption().hash(str: self)
        }
    }
}
