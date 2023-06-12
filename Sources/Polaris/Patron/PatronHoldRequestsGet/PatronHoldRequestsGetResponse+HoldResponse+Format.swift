import Foundation

extension Polaris.Patron.PatronHoldRequestsGetResponse.HoldRequest {
    
    public struct Format: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let description: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "FormatID"
            case description = "FormatDescription"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            description = try container.decode(String.self, forKey: .description)
        }
    }
}
