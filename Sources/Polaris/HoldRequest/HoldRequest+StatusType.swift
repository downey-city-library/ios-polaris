import Foundation

extension Polaris.HoldRequest {
    
    public enum StatusType: Int, Decodable {
        case answer = 2
        case conditional = 3
        case error = 1
        case unknown = -1
    }
}

// MARK: - INITIALIZATION
extension Polaris.HoldRequest.StatusType {

    public init(from decoder: Decoder) throws {
        self = try Self(from: decoder, default: .unknown)
    }
}

// MARK: - PROPERTIES
extension Polaris.HoldRequest.StatusType {
    
    public var description: String {
        switch self {
        case .answer: return "Answer"
        case .conditional: return "Conditional"
        case .error: return "Error"
        case .unknown: return "Unknown"
        }
    }
    
    public var int: Int { return self.rawValue }
}
