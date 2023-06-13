import Foundation

extension Polaris.Patron.Blocks.PatronRenewBlocksGetResponse {
    
    public struct Block: Decodable {
        
        // MARK: - PROPERTIES
        public let id = UUID().uuidString
        public let patron: String
        public let patronName: String
        public let description: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case patron = "PatronID"
            case patronName = "PatronName"
            case description = "BlockDescription"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            patron = try container.decode(String.self, forKey: .patron)
            patronName = try container.decode(String.self, forKey: .patronName)
            description = try container.decode(String.self, forKey: .description)
        }
    }
}
