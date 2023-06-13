import Foundation

extension Polaris.Patron.TitleList {
    
    public struct PatronTitleListAddTitleResponse: Decodable, PolarisResponse {
    
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let position: Int
        public let id: Int?

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case position = "Position"
            case id = "RecordID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            position = try container.decode(Int.self, forKey: .position)
            id = try container.decodeIfPresent(Int.self, forKey: .id)
        }
    }
}
