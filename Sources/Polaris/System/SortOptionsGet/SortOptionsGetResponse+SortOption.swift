import Foundation

extension Polaris.System.SortOptionsGetResponse {
    
    public struct SortOption: Decodable {
        
        // MARK: - PROPERTIES
        public let code: String
        public let description: String
        public let options: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case code = "Code"
            case description = "Description"
            case options = "Options"
        }
        
        // MARK: INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            code = try container.decode(String.self, forKey: .code)
            description = try container.decode(String.self, forKey: .description)
            options = try container.decode(String.self, forKey: .options)
        }
    }
}
