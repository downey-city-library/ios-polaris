import Foundation

extension Polaris.Patron.PatronPreferencesGetResponse.Preferences {

    public struct DeliveryEmail {

        // MARK: - PROPERTIES
        public let format: Format

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            format = try Format(from: decoder)
        }
    }
}
