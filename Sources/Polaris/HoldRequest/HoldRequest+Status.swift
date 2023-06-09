import Foundation

extension Polaris.HoldRequest {
    
    public struct Status: Decodable {
        
        // MARK: -  PROPERTIES
        public let type: Polaris.HoldRequest.StatusType
        public let value: Polaris.HoldRequest.StatusValue
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case type = "StatusType"
            case value = "StatusValue"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            type = try container.decode(Polaris.HoldRequest.StatusType.self, forKey: .type)
            value = try container.decode(Polaris.HoldRequest.StatusValue.self, forKey: .value)
        }
    }
}
