import Foundation

extension Polaris.RecordSet.RecordSetRecordsGetResponse {
    
    public struct Patron: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "RecordID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
        }
    }
}
