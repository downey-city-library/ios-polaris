import Foundation

extension Polaris.Patron.Blocks.PatronCirculateBlocksGetResponse {
    
    public struct Block: Decodable {
        
        // MARK: - PROPERTIES
        public let id: String = UUID().uuidString
        public let description: String
        public let patron: Int
        public let patronName: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case description = "BlockDescription"
            case patron = "PatronID"
            case patronName = "PatronName"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            description = try container.decode(String.self, forKey: .description)
            patron = try container.decode(Int.self, forKey: .patron)
            patronName = try container.decode(String.self, forKey: .patronName)
        }
    }
}
