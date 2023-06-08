import Foundation

extension Polaris.Bib.BibHoldingsGetResponse.Holding {
    
    public struct Location {
        
        // MARK: - PROPERTIES
        public let id: Int?
        public let name: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            case id = "LocationID"
            case name = "LocationName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decodeIfPresent(Int.self, forKey: .id)
            name = try container.decodeIfPresent(String.self, forKey: .name)
        }
    }
}
