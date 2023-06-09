import Foundation

extension Polaris.HoldRequest.HoldRequestSuspendResponse {

    public struct SuspendedHold: Decodable {
        
        // MARK: - PROPERTIES
        public let code: Int
        public let errorMessage: String?
        public let newActivationDate: Date?
        public let newExpirationDate: Date?
        public let id: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case code = "ReturnCode"
            case errorMessage = "ErrorMessage"
            case newActivationDate = "NewActivationDate"
            case newExpirationDate = "NewExpirationDate"
            case id = "SystemHoldRequestID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            code = try container.decode(Int.self, forKey: .code)
            errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
            newActivationDate = try container.decodeIfPresent(String.self, forKey: .newActivationDate)?.toDate()
            newExpirationDate = try container.decodeIfPresent(String.self, forKey: .newExpirationDate)?.toDate()
            id = try container.decode(Int.self, forKey: .id)
        }
    }
}
