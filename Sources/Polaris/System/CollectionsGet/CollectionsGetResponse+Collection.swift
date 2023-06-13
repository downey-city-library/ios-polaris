import Foundation

extension Polaris.System.CollectionsGetResponse {
    
    public struct Collection: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let name: String
        public let abbreviation: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "ID"
            case name = "Name"
            case abbreviation = "Abbreviation"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            abbreviation = try container.decode(String.self, forKey: .abbreviation)
        }
    }
}
