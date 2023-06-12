import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct MessageCounts: Decodable {
        
        // MARK: - PROPERTIES
        public let new: Int?
        public let read: Int?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case new = "MessageNewCount"
            case read = "MessageReadCount"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            new = try container.decodeIfPresent(Int.self, forKey: .new)
            read = try container.decodeIfPresent(Int.self, forKey: .read)
        }
    }
}
