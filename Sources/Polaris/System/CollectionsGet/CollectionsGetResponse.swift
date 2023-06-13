import Foundation

extension Polaris.System {
    
    public struct CollectionsGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let collections: [Collection]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case collections = "CollectionsRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            collections = try container.decode([Collection].self, forKey: .collections)
        }
    }
}
