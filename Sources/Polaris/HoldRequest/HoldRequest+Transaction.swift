import Foundation

extension Polaris.HoldRequest {
    
    public struct Transaction: Decodable {
        
        // MARK: - PROPERTIES
        public let groupQualifier: String
        public let qualifier: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case groupQualifier = "TxnGroupQualifer"
            case qualifier = "TxnQualifier"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.groupQualifier = try container.decode(String.self, forKey: .groupQualifier)
            self.qualifier = try container.decode(String.self, forKey: .qualifier)
        }
    }
}
