import Foundation

extension Polaris.Bib.BibGetResponse {
    
    public struct Row: Decodable {
        
        // MARK: - PROPERTIES
        public let alternate: Bool
        public let elementID: Int
        public let label: String
        public let occurence: Int
        public let value: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case alternate = "Alternate"
            case elementID = "ElementID"
            case label = "Label"
            case occurence = "Occurence"
            case value = "Value"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            alternate = try container.decode(Bool.self, forKey: .alternate)
            elementID = try container.decode(Int.self, forKey: .elementID)
            label = try container.decode(String.self, forKey: .label)
            occurence = try container.decode(Int.self, forKey: .occurence)
            value = try container.decode(String.self, forKey: .value)
        }
    }
}
