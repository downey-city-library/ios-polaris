import Foundation

extension Polaris.Authenticate.AuthenticateStaffResponse {
    
    public struct Access {
        
        // MARK: - PROPERTIES
        public let expirationDate: Date
        public let secret: String
        public let token: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case accessToken = "AccessToken"
            case accessSecret = "AccessSecret"
            case authExpDate = "AuthExpDate"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            expirationDate = (try container.decode(String.self, forKey: .authExpDate)).toDate()!
            secret = try container.decode(String.self, forKey: .accessSecret)
            token = try container.decode(String.self, forKey: .accessToken)
        }
    }
}
