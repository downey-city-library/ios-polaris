import Foundation

extension Polaris.Patron.PatronPreferencesGetResponse.Preferences.DeliveryEmail {

    public struct Format {

        // MARK: - PROPERTIES
        public let description: String?
        public let id: Int?

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case description = "DeliveryEmailFormatDescription"
            case id = "DeliveryEmailFormatID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            description = try container.decodeIfPresent(String.self, forKey: .description)
            id = try container.decodeIfPresent(Int.self, forKey: .id)
        }
    }
}
