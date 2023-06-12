import Foundation

extension Polaris.Patron.PatronHoldRequestsGetResponse.HoldRequest {
    
    public struct Pickup: Decodable {
        
        // MARK: - PROPERTIES
        public let branch: Branch
        public let byDate: Date?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case byDate = "PickupByDate"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            branch = try Branch(from: decoder)
            byDate = try container.decodeIfPresent(String.self, forKey: .byDate)?.toDate()
        }
    }
}
