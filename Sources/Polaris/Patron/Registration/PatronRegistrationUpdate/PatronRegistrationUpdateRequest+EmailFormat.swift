import Foundation

extension Polaris.Patron.Registration.PatronRegistrationUpdateRequest {
    
    public struct EmailFormat: Encodable {
        
        // MARK: - PROPERTIES
        public let description: String?
        public let id: Int?

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case description = "DeliveryEmailFormatDescription"
            case id = "DeliveryEmailFormatID"
        }
    }
}
