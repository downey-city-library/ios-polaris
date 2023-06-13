import Foundation

extension Polaris.System.OrganizationsGetResponse {
    
    public struct Organization: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let code: Int
        public let name: String
        public let abbreviation: String
        public let displayName: String
        public let parentOrganization: Int?
        
        // MARK: CODING KEYS
        enum CodingKeys: String, CodingKey {
            case id = "OrganizationID"
            case code = "OrganizationCodeID"
            case name = "Name"
            case abbreviation = "Abbreviation"
            case displayName = "DisplayName"
            case parentOrganization = "ParentOrganizationID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            code = try container.decode(Int.self, forKey: .code)
            name = try container.decode(String.self, forKey: .name)
            abbreviation = try container.decode(String.self, forKey: .abbreviation)
            displayName = try container.decode(String.self, forKey: .displayName)
            parentOrganization = try container.decodeIfPresent(Int.self, forKey: .parentOrganization)
        }
    }
}
