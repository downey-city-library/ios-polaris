import Foundation

extension Polaris.Patron.ReadingHistory {
    
    public struct PatronReadingHistoryGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let items: [Item]

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case patronReadingHistoryGetRows = "PatronReadingHistoryGetRows"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            items = try container.decode([Item].self, forKey: .patronReadingHistoryGetRows)
        }
    }
}
