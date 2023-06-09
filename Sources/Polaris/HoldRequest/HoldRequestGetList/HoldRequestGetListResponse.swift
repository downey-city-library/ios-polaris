import Foundation

extension Polaris.HoldRequest {
    
    public struct HoldRequestGetListResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let createTime: Date?
        public let expirationTime: Date?
        public let holdRequests: [HoldRequest]
        public let recordCount: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case createTime = "PickListCreateTime"
            case expirationTime = "PickListExpirationTime"
            case holdRequests = "RequestPicklistRows"
            case recordCount = "RecordCount"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            createTime = try container.decodeIfPresent(String.self, forKey: .createTime)?.toDate()
            expirationTime = try container.decodeIfPresent(String.self, forKey: .expirationTime)?.toDate()
            holdRequests = try container.decode([HoldRequest].self, forKey: .holdRequests)
            recordCount = try container.decode(Int.self, forKey: .recordCount)
        }
    }
}
