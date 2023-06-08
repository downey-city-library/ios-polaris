import Foundation

extension Polaris.Bib.BibHoldingsGetResponse.Holding {
    
    public struct Notes {
        
        // MARK: - PROPERTIES
        public let holdings: String?
        public let `public`: String?
        public let textualHoldings: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case holdings = "HoldingsNote"
            case `public` = "PublicNote"
            case textualHoldings = "TextualHoldingsNote"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            holdings = try container.decodeIfPresent(String.self, forKey: .holdings)
            `public` = try container.decodeIfPresent(String.self, forKey: .public)
            textualHoldings = try container.decodeIfPresent(String.self, forKey: .textualHoldings)
        }
    }
}
