import Foundation
import CommonCrypto

extension String {
    
    /// Hash a string with a provided key.
    /// - parameter key: The key used when encypting the string.
    /// - returns: A hashed string.
    
    internal func hmac(key: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), key, key.count, self, self.count, &digest)
        let data = Data(digest)
        return Data(data).base64EncodedString()
    }
    
    /// Convert a string to a date.
    /// - returns: The date value of the string.  
    
    func toDate() -> Date? {
        if let start = self.firstIndex(of: "("), let end = self.lastIndex(of: "-") {

            let trimmedString = self[start...end].trimmingCharacters(in: ["(","-"])
            guard let interval = TimeInterval(trimmedString) else { return nil }
            
            let dateInterval = interval / 1000.0
            
            return Date(timeIntervalSince1970: dateInterval)
        } else {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd yyyy"
            if let date = formatter.date(from: self) {
                return date
            } else {
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                
                if formatter.date(from: self) == nil {
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    return formatter.date(from: self)
                }
                return formatter.date(from: self)
            }
        }
    }
    
    /// Convert a string to an interger using dot notation.
    /// - returns: The interger value of the string (optional).
    
    internal func toInt() -> Int? {
        return Int(self)
    }
}
