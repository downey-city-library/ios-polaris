import Foundation

extension Polaris.Patron {
    
    public enum ILLRequestSet: String {
        case all = "all"
        case received = "ReceivedTransferred"
        case cancelled = "cancelled"
        
        public var string: String { self.rawValue }
    }
}
