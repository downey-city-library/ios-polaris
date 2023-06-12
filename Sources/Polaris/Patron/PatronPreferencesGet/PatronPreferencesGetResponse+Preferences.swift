import Foundation

extension Polaris.Patron.PatronPreferencesGetResponse {

    public struct Preferences: Decodable {
        
        // MARK: - PROPERTIES
        public let deliveryEmail: DeliveryEmail
        public let deliveryMethod: Polaris.Patron.DeliveryMethod
        public let readingList: ReadingList

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "DeliveryMethodID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            deliveryEmail = try DeliveryEmail(from: decoder)
            deliveryMethod = try container.decode(Polaris.Patron.DeliveryMethod.self, forKey: .id)
            readingList = try ReadingList(from: decoder)
        }
    }
}
