import Foundation

extension Polaris.System.PickupBranchesGetResponse {
    
    public struct PickupBranch: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case id = "ID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
        }
    }
}
