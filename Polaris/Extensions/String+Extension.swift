//
//  String+Extension.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    /**
     Hash a string with a provided key.
     - parameter key: The key used when encypting the string.
     - returns: A hashed string.
     */
    internal func hmac(key: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), key, key.count, self, self.count, &digest)
        let data = Data(bytes: digest)
        return Data(bytes: data).base64EncodedString()
    }
}
