import Foundation

extension Polaris.Patron.PatronPreferencesGetResponse.Preferences {

    public struct ReadingList {

        // MARK: - PROPERTIES
        public let isEnabled: Bool?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case isEnabled = "ReadingListEnabled"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            isEnabled = try container.decodeIfPresent(Bool.self, forKey: .isEnabled)
        }
    }
}
