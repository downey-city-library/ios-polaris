import Foundation

extension Polaris.HoldRequest.HoldRequestActivateResponse {
    
    public struct ActivatedHold: Decodable {
        
        // MARK: - PROPERTIES
        public let code: Int
        public let errorMessage: String?
        public let activationDate: Date?
        public let expirationDate: Date?
        public let id: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case code = "ReturnCode"
            case errorMessage = "ErrorMessage"
            case activationDate = "NewActivationDate"
            case expirationDate = "NewExpirationDate"
            case id = "SystemHoldRequestID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            code = try container.decode(Int.self, forKey: .code)
            errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
            activationDate = try (container.decode(String.self, forKey: .activationDate)).toDate()
            expirationDate = try (container.decode(String.self, forKey: .expirationDate)).toDate()
            id = try container.decode(Int.self, forKey: .id)
        }
    }
}
