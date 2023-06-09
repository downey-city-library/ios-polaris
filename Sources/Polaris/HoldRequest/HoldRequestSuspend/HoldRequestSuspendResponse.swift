import Foundation

extension Polaris.HoldRequest {

    public struct HoldRequestSuspendResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let suspendedHolds: [SuspendedHold]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case rows = "HoldRequestActivationRows"
        }
        
        // MARK: - INTIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            suspendedHolds = try container.decode([SuspendedHold].self, forKey: .rows)
        }
    }
}
