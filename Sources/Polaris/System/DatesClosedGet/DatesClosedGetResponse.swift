import Foundation

extension Polaris.System {
    
    public struct DatesClosedGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let datesClosed: [DateClosed]
        
        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case datesClosed = "DatesClosedRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            datesClosed = try container.decode([DateClosed].self, forKey: .datesClosed)
        }
    }
}
