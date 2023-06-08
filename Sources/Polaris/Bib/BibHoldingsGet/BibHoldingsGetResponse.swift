import Foundation

extension Polaris.Bib {
    
    public struct BibHoldingsGetResponse: PolarisResponse, Decodable {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let holdings: [Holding]
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case rows = "BibHoldingsGetRows"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            holdings = try container.decode([Holding].self, forKey: .rows)
        }
    }

}
