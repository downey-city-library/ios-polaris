import Foundation

extension Polaris.Patron.Blocks.PatronCirculateBlocksGetResponse {
    
    public struct Name: Decodable {
        
        // MARK: - PROPERTIES
        public let first: String
        public let last: String
        public let middle: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case first = "NameFirst"
            case last = "NameLast"
            case middle = "NameMiddle"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            first = try container.decode(String.self, forKey: .first)
            last = try container.decode(String.self, forKey: .last)
            middle = try container.decodeIfPresent(String.self, forKey: .middle)
        }
        
        public init(first: String, last: String, middle: String? = nil) {
            self.first = first
            self.last = last
            self.middle = middle
        }
    }
}
