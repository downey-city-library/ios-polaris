import Foundation

extension Polaris.System {
    
    public struct RequestsUpdateStatusResponse: Decodable, PolarisResponse {
    
        // MARK: - PROPERTIES
        public let error: PolarisError?

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        }
    }
}
