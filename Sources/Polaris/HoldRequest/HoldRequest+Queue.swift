import Foundation

extension Polaris.HoldRequest {
    
    public struct Queue: Decodable {
        
        // MARK: -  PROPERTIES
        public let position: Int
        public let total: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case position = "QueuePosition"
            case total = "QueueTotal"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            position = try container.decode(Int.self, forKey: .position)
            total = try container.decode(Int.self, forKey: .total)
        }
    }
}
