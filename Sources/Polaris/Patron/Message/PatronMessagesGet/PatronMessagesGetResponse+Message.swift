import Foundation

extension Polaris.Patron.Message.PatronMessagesGetResponse {
    
    public struct Message: Decodable {
        
        // MARK: - PROPERTIES
        public let type: Int
        public let id: Int
        public let orgName: String
        public let date: Date?
        public let value: String
        public let isRead: Bool

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case type = "Type"
            case id = "ID"
            case orgName = "OrgName"
            case date = "Date"
            case value = "Value"
            case isRead = "IsRead"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            type = try container.decode(Int.self, forKey: .type)
            id = try container.decode(Int.self, forKey: .id)
            orgName = try container.decode(String.self, forKey: .orgName)
            date = try container.decode(String.self, forKey: .date).toDate()
            value = try container.decode(String.self, forKey: .value)
            isRead = try container.decode(Bool.self, forKey: .isRead)
        }
    }
}
