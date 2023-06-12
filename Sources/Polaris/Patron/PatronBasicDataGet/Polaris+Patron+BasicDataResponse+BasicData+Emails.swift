import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Emails {
        
        // MARK: - PROPERTIES
        public let alternate: String?
        public let primary: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case alternate = "AltEmailAddress"
            case primary = "EmailAddress"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            alternate = try container.decodeIfPresent(String.self, forKey: .alternate)
            primary = try container.decodeIfPresent(String.self, forKey: .primary)
        }
    }
}
