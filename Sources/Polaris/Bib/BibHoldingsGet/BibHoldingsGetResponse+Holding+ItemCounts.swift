import Foundation

extension Polaris.Bib.BibHoldingsGetResponse.Holding {
    
    public struct ItemCounts {
        
        // MARK: - PROPERTIES
        public let `in`: Int?
        public let total: Int?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case `in` = "ItemsIn"
            case total = "ItemsTotal"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            `in` = try container.decodeIfPresent(Int.self, forKey: .in)
            total = try container.decodeIfPresent(Int.self, forKey: .total)
        }
    }
}
