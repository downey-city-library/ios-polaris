import Foundation

extension Polaris.System {
    
    public struct SAMobilePhoneCarriersGetResultResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let carriers: [MobilePhoneCarrier]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case carriers = "SAMobilePhoneCarriersGetRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            carriers = try container.decode([MobilePhoneCarrier].self, forKey: .carriers)
        }
    }
}
