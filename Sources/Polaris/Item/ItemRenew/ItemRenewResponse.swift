import Foundation

extension Polaris.Item {

    public struct ItemRenewResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let result: Result
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case result = "ItemRenewResult"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            result = try container.decode(Result.self, forKey: .result)
        }
    }
}
