import Foundation

internal struct DateTime {
    
    /// The current date and time as an RFC 1123 formatted string.
    /// Sample Output: Thu, 14 Mar 2019 16:13:34 GMT
    /// - returns: The RFC 1123 formatted string.
    
    internal static func rfc1123() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        let dateTime = formatter.string(from: Date())
        return dateTime
    }
}
