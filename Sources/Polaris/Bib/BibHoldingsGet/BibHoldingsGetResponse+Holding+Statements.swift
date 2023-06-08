import Foundation

extension Polaris.Bib.BibHoldingsGetResponse.Holding {
    
    public struct Statements {
        
        // MARK: - PROPERTIES
        public let holdings: String?
        public let retention: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case holdings = "HoldingsStatement"
            case retention = "RetentionStatement"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            holdings = try container.decodeIfPresent(String.self, forKey: .holdings)
            retention = try container.decodeIfPresent(String.self, forKey: .retention)
        }
    }
}
