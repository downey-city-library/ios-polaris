import Foundation

extension Polaris.System {
    
    public struct HeadingsSearchResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let headings: [Heading]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case headings = "HeadingsSearchRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            headings = try container.decode([Heading].self, forKey: .headings)
        }
    }
}
