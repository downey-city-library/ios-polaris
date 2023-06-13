import Foundation

extension Polaris.System {
    
    public struct OrganizationsGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let organizations: [Organization]

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case organizations = "OrganizationsGetRows"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            organizations = try container.decode([Organization].self, forKey: .organizations)
        }
    }
}
