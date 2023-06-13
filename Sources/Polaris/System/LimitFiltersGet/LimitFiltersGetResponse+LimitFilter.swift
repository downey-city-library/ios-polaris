import Foundation

extension Polaris.System.LimitFiltersGetResponse {
    
    public struct LimitFilter: Decodable {
        
        // MARK: PROPERTIES
        public let description: String
        public let cclFilter: String
        public let displayOrder: Int

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case description = "Description"
            case cclFilter = "CCLFilter"
            case displayOrder = "DisplayOrder"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            description = try container.decode(String.self, forKey: .description)
            cclFilter = try container.decode(String.self, forKey: .cclFilter)
            displayOrder = try container.decode(Int.self, forKey: .displayOrder)
        }
    }
}
