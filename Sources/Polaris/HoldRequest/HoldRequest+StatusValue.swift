import Foundation

extension Polaris.HoldRequest {
    
    public enum StatusValue: Int, Decodable {
        case aborted = 0
        case success = 1
        case conditionalAvailableLocally = 3
        case conditionalAcceptILLPolicy = 4
        case conditionalExistingHolds = 5
        case conditionalNoItemsAttached = 6
        case conditionalAcceptLocalHoldPolicy = 7
        case errorSelectPickupLocation = 2
        case errorRequestsNotAllowed = 26
        case unknown = -1
    }
}

// MARK: - INITIALIZATION
extension Polaris.HoldRequest.StatusValue {
    
    public init(from decoder: Decoder) throws {
        self = try Self(from: decoder, default: .unknown)
    }
}

// MARK: - PROPERTIES
extension Polaris.HoldRequest.StatusValue {
    
    public var description: String {
        switch self {
        case .aborted: return "Hold request not placed"
        case .success: return "Hold request placed"
        case .conditionalAvailableLocally: return "Conditional: Item available locally"
        case .conditionalAcceptILLPolicy: return "Conditional: Accept ILL policy"
        case .conditionalExistingHolds: return "Conditional: Accept even with existing holds"
        case .conditionalNoItemsAttached: return "Conditional: No items attached, still place hold"
        case .conditionalAcceptLocalHoldPolicy: return "Conditional: Accept local hold policy"
        case .errorSelectPickupLocation: return "Error: Select pickup location"
        case .errorRequestsNotAllowed: return "Error: Requests are not permitted for this title"
        case .unknown: return "Error: Response not defined"
        }
    }
    
    public var int: Int { return self.rawValue }
}
