import Foundation

extension Polaris.Authenticate {
 
    public struct AuthenticatePatronResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let token: String
        public let id: Int
        public private(set) var barcode: String = ""
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case accessToken = "AccessToken"
            case patronID = "PatronID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            token = try container.decode(String.self, forKey: .accessToken)
            id = try container.decode(Int.self, forKey: .patronID)
        }
        
        // MARK: - PUBLIC METHODS
        public mutating func set(barcode: String) {
            self.barcode = barcode
        }
    }
}
