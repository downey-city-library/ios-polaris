import Foundation

extension Polaris.HoldRequest {
    
    public struct HoldRequestReplyResponse: Decodable, PolarisResponse {
        
        // MARK: - TYPEALIASES
        public typealias Queue = Polaris.HoldRequest.Queue
        public typealias Status = Polaris.HoldRequest.Status
        public typealias Transaction = Polaris.HoldRequest.Transaction
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public var guid: String?
        public let transaction: Transaction
        public let status: Status
        public let message: String
        public let queue: Queue
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case guid = "RequestGUID"
            case message = "Message"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            guid = try container.decodeIfPresent(String.self, forKey: .guid)
            transaction = try Transaction(from: decoder)
            status = try Status(from: decoder)
            message = try container.decode(String.self, forKey: .message)
            queue = try Queue(from: decoder)
        }
    }
}
