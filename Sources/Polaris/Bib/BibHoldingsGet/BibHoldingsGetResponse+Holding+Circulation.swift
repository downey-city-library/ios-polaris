import Foundation

extension Polaris.Bib.BibHoldingsGetResponse.Holding {
    
    public struct Circulation {
        
        // MARK: - PROPERTIES
        public let dueDate: Date?
        public let lastCirculated: Date?
        public let status: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case dueDate = "DueDate"
            case lastCirculated = "LastCircDate"
            case status = "CircStatus"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate)?.toDate()
            lastCirculated = try container.decodeIfPresent(String.self, forKey: .lastCirculated)?.toDate()
            status = try container.decodeIfPresent(String.self, forKey: .status)
        }
    }
}
