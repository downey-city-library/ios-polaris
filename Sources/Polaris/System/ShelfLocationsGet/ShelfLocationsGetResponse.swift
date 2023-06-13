import Foundation

extension Polaris.System {
    
    public struct ShelfLocationsGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let shelfLocations: [ShelfLocation]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case shelfLocations = "ShelfLocationsRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            shelfLocations = try container.decode([ShelfLocation].self, forKey: .shelfLocations)
        }
    }
}
