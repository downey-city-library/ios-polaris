import Foundation

extension Polaris.Bib {
    
    public struct BibKeywordSearchResponse: PolarisResponse, Decodable {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let bibs: [Bib]
        public let count: Int
        public let query: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case bibs = "BibSearchRows"
            case count = "TotalRecordsFound"
            case query = "WordList"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            bibs = try container.decode([Bib].self, forKey: .bibs)
            count = try container.decode(Int.self, forKey: .count)
            query = try container.decode(String.self, forKey: .query)
        }
    }
}
