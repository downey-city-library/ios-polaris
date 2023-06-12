import Foundation

extension Polaris.Patron.Account.PatronAccountGetTitleListsResponse {
    
    public struct TitleList: Decodable, Hashable {
        
        // MARK: - PROPERTIES
        public let name: String
        public let sorted: Bool
        public let count: Int
        public let id: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case name = "RecordStoreName"
            case sorted = "Sorted"
            case count = "Count"
            case id = "RecordStoreID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            name = try container.decode(String.self, forKey: .name)
            sorted = try container.decode(Bool.self, forKey: .sorted)
            count = try container.decode(Int.self, forKey: .count)
            id = try container.decode(Int.self, forKey: .id)
        }
        
        public init(_ name: String) {
            self.name = name
            sorted = false
            count = 0
            id = -1
        }
    }
}
