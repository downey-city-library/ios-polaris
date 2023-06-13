import Foundation

extension Polaris.Patron.Blocks {
    
    public struct PatronRenewBlocksGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let blocks: [Block]
        public let canRenew: Bool
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case blocks = "Blocks"
            case canRenew = "CanPatronRenew"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            blocks = try data.decode([Block].self, forKey: .blocks)
            canRenew = try data.decode(Bool.self, forKey: .canRenew)
        }
    }
}
