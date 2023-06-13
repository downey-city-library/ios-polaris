import Foundation

extension Polaris.System {
    
    public struct PatronCodesGetResultResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let patronCodes: [PatronCode]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case patronCodes = "PatronCodesRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            patronCodes = try container.decode([PatronCode].self, forKey: .patronCodes)
        }
    }
}
