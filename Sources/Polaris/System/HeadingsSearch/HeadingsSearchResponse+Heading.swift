import Foundation

extension Polaris.System.HeadingsSearchResponse {
    
    public struct Heading: Decodable {
        
        // MARK: - PROPERTIES
        public let position: Int
        public let displayType: Int
        public let displayConstant: String?
        public let displayTerm: String
        public let globalOccurrences: Int
        public let id: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case position = "Position"
            case displayType = "DisplayType"
            case displayConstant = "DisplayConstant"
            case displayTerm = "DisplayTerm"
            case globalOccurrences = "GlobalOccurrences"
            case id = "HeadingID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            position = try container.decode(Int.self, forKey: .position)
            displayType = try container.decode(Int.self, forKey: .displayType)
            displayConstant = try? container.decode(String.self, forKey: .displayConstant)
            displayTerm = try container.decode(String.self, forKey: .displayTerm)
            globalOccurrences = try container.decode(Int.self, forKey: .globalOccurrences)
            id = try container.decode(String.self, forKey: .id)
        }
    }
}
