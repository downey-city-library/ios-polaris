import Foundation

extension Polaris.HoldRequest.HoldRequestReplyRequest {
    
    public enum State: Int {
        case availableLocally = 1
        case illPolicy = 2
        case existingHolds = 3
        case noItems = 4
        case localPolicy = 5
        
        public var int: Int { return self.rawValue }
    }
}
