import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct HoldRequestCounts: Decodable {
        
        // MARK: - PROPERTIES
        public let current: Int?
        public let held: Int?
        public let shipped: Int?
        public let total: Int?
        public let unclaimed: Int?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case current = "HoldRequestsCurrentCount"
            case held = "HoldRequestsHeldCount"
            case shipped = "HoldRequestsShippedCount"
            case total = "HoldRequestsTotalCount"
            case unclaimed = "HoldRequestsUnclaimedCount"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            current = try container.decodeIfPresent(Int.self, forKey: .current)
            held = try container.decodeIfPresent(Int.self, forKey: .held)
            shipped = try container.decodeIfPresent(Int.self, forKey: .shipped)
            total = try container.decodeIfPresent(Int.self, forKey: .total)
            unclaimed = try container.decodeIfPresent(Int.self, forKey: .unclaimed)
        }
    }
}
