import Foundation

extension Polaris.Patron.PatronHoldRequestsGetResponse.HoldRequest.Pickup {
    
    public struct Branch: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let name: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "PickupBranchID"
            case name = "PickupBranchName"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
        }
    }
}
