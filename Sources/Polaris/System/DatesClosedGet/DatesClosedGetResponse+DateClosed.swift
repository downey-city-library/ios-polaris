import Foundation

extension Polaris.System.DatesClosedGetResponse {
    
    public struct DateClosed: Decodable, Hashable {
        
        // MARK: - PROPERTIES
        public let date: Date
        
        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case date = "DateClosed"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            date = try container.decode(String.self, forKey: .date).toDate()!
        }
    }
}
