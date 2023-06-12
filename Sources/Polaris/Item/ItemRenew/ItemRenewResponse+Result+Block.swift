import Foundation

extension Polaris.Item.ItemRenewResponse.Result {

    public struct Block: Decodable {

        // MARK: - PROPERTIES
        public let allowsOverride: Bool
        public let code: Int
        public let description: String
        public let id: Int
        public let type: Int

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case allowsOverride = "ErrorAllowOverride"
            case errorCode = "PolarisErrorCode"
            case errorDescription = "ErrorDesc"
            case errorType = "PAPIErrorType"
            case id = "ItemRecordID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            allowsOverride = try container.decode(Bool.self, forKey: .allowsOverride)
            code = try container.decode(Int.self, forKey: .errorCode)
            description = try container.decode(String.self, forKey: .errorDescription)
            id = try container.decode(Int.self, forKey: .id)
            type = try container.decode(Int.self, forKey: .errorType)
        }
    }
}
