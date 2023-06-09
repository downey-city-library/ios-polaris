import Foundation

extension Polaris.HoldRequest.HoldRequestReplyRequest {
    
    public enum Answer: Int {
        case no = 0
        case yes = 1
        
        public var int: Int { return self.rawValue }
    }
}
