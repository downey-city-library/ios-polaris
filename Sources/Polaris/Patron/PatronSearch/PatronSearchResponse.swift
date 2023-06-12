import Foundation

extension Polaris.Patron {

    public struct PatronSearchResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let query: String
        public let patrons: [Patron]
        public let totalRecords: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case query = "WordList"
            case patrons = "PatronSearchRows"
            case totalRecords = "TotalRecordsFound"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            query = try container.decode(String.self, forKey: .query)
            patrons = try container.decode([Patron].self, forKey: .patrons)
            totalRecords = try container.decode(Int.self, forKey: .totalRecords)
        }
    }
}
