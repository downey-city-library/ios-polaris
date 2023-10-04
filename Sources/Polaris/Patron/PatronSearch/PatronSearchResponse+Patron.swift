import Foundation

extension Polaris.Patron.PatronSearchResponse {
    
    public struct Patron: Decodable, Identifiable, Hashable {
        
        // MARK: - PROPERTIES
        public let barcode: String
        public let fullName: String
        public let id: Int
        public let organization: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case barcode = "Barcode"
            case fullName = "PatronFirstLastName"
            case id = "PatronID"
            case organization = "OrganizationID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            barcode = try container.decode(String.self, forKey: .barcode)
            fullName = try container.decode(String.self, forKey: .fullName)
            id = try container.decode(Int.self, forKey: .id)
            organization = try container.decode(Int.self, forKey: .organization)
        }
    }
}
