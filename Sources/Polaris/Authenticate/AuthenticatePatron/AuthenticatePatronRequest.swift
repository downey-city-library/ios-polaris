import Foundation

extension Polaris.Authenticate {
 
    struct AuthenticatePatronRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let barcode: String
        public let password: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case barcode = "Barcode"
            case password = "Password"
        }
    }
}
