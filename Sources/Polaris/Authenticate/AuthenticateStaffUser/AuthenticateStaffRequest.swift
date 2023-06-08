import Foundation

extension Polaris.Authenticate {
    
    struct AuthenticateStaffRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let domain: String
        public let username: String
        public let password: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case domain = "Domain"
            case username = "Username"
            case password = "Password"
        }
    }
}
