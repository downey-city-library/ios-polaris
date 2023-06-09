import Foundation

extension Array where Element == Int {
    public var commaDelimitedString: String { self.map{String($0)}.joined(separator: ",") }
}
