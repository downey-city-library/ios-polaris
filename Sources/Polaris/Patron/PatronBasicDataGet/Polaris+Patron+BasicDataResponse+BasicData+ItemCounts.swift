import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct ItemCounts: Decodable {
        
        // MARK: - PROPERTIES
        public var lost: Int?
        public var out: Int?
        public var overdue: Int?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case lost = "ItemsOutLostCount"
            case out = "ItemsOutCount"
            case overdue = "ItemsOverdueCount"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            lost = try container.decodeIfPresent(Int.self, forKey: .lost)
            out = try container.decodeIfPresent(Int.self, forKey: .out)
            overdue = try container.decodeIfPresent(Int.self, forKey: .overdue)
        }
    }
}
