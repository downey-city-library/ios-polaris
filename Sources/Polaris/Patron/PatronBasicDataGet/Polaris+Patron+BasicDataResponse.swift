import Foundation

extension Polaris.Patron {
    
    public struct BasicDataResponse: PolarisResponse, Decodable {
                
        // MARK: - PROPERTIES
        public let basicData: BasicData
        public let error: PolarisError?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case basicData = "PatronBasicData"
            case errorCode = "PAPIErrorCode"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            basicData = try container.decode(BasicData.self, forKey: .basicData)
        }
    }
}
