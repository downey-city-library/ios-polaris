import Foundation

extension Polaris.System.ShelfLocationsGetResponse {
    
    public struct ShelfLocation: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let organization: Int
        public let description: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "ID"
            case organization = "OrganizationID"
            case description = "Description"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            organization = try container.decode(Int.self, forKey: .organization)
            description = try container.decode(String.self, forKey: .description)
        }
    }
}
