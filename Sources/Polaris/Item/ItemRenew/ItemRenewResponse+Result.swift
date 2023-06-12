import Foundation

extension Polaris.Item.ItemRenewResponse {
    
    public struct Result: Decodable {
    
        // MARK: - PROPERTIES
        public private(set) var blocks: [Block]
        public private(set) var items: [Item]
    
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case blockRows = "BlockRows"
            case itemRows = "DueDateRows"
        }
    
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
    
            blocks = try container.decode([Block].self, forKey: .blockRows)
            items = try container.decode([Item].self, forKey: .itemRows)
        }
    }
}
