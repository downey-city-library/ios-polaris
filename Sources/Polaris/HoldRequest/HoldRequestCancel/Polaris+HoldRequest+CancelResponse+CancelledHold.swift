import Foundation

extension Polaris.HoldRequest.HoldRequestCancelResponse {
    
    public struct CancelledHold: Decodable {
        
        // MARK: - PROPERTIES
        public let errorMessage: String?
        public let id: Int
        public let returnCode: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorMessage = "ErrorMessage"
            case id = "SysHoldRequestID"
            case returnCode = "ReturnCode"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
            id = try container.decode(Int.self, forKey: .id)
            returnCode = try container.decode(Int.self, forKey: .returnCode)
        }
    }
}
