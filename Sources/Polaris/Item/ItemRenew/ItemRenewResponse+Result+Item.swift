import Foundation

extension Polaris.Item.ItemRenewResponse.Result {

    public struct Item: Decodable {

        // MARK: - PROPERTIES
        public let dueDate: Date?
        public let id: Int

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {

            case dueDate = "DueDate"
            case id = "ItemRecordID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate)?.toDate()
            id = try container.decode(Int.self, forKey: .id)
        }
    }
}
