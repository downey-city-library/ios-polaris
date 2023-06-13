import Foundation

extension Polaris.Item {
    
    public enum Set: String {
        case all = "all"
        case lost = "lost"
        case overdue = "overdue"
        
        public var string: String { return self.rawValue }
    }
}
