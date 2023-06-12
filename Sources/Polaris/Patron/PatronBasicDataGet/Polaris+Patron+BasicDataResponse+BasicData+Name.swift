import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Name: Decodable {
        
        // MARK: - PROPERTIES
        public let first: String?
        public let last: String?
        public let middle: String?
        public let suffix: String?
        public let title: Polaris.Patron.NameTitle?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case first = "NameFirst"
            case last = "NameLast"
            case middle = "NameMiddle"
            case suffix = "NameSuffix"
            case title = "NameTitle"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            first = try container.decodeIfPresent(String.self, forKey: .first)
            last = try container.decodeIfPresent(String.self, forKey: .last)
            middle = try container.decodeIfPresent(String.self, forKey: .middle)
            suffix = try container.decodeIfPresent(String.self, forKey: .suffix)
            title = try container.decodeIfPresent(Polaris.Patron.NameTitle.self, forKey: .title)
        }
    }
}
