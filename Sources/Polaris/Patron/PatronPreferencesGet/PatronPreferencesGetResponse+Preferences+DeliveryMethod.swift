import Foundation

extension Polaris.Patron.PatronPreferencesGetResponse.Preferences {

    public struct DeliveryMethod {
        
        // MARK: - PROPERTIES
        public let description: String?
        public let id: Int?

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case description = "DeliveryMethodDescription"
            case id = "DeliveryMethodID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            description = try container.decodeIfPresent(String.self, forKey: .description)
            id = try container.decodeIfPresent(Int.self, forKey: .id)
        }
    }
}
