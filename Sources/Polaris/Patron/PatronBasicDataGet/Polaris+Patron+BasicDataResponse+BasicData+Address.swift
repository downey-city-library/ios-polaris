import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Address: Decodable {
        
        // MARK: - PROPERTIES
        public let city: String?
        public let county: String?
        public let country: String?
        public let countryId: Int?
        public let ID: Int?
        public let label: String?
        public let postalCode: String?
        public let state: String?
        public let streetOne: String?
        public let streetTwo: String?
        public let typeID: Int?
        public let zipPlusFour: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case city = "City"
            case county = "County"
            case country = "Country"
            case countryId = "CountryID"
            case ID = "AddressID"
            case label = "FreeTextLabel"
            case postalCode = "PostalCode"
            case state = "State"
            case streetOne = "StreetOne"
            case streetTwo = "StreetTwo"
            case typeID = "AddressTypeID"
            case zipPlusFour = "ZipPlusFour"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            city = try container.decodeIfPresent(String.self, forKey: .city)
            county = try container.decodeIfPresent(String.self, forKey: .county)
            country = try container.decodeIfPresent(String.self, forKey: .country)
            countryId = try container.decodeIfPresent(Int.self, forKey: .countryId)
            ID = try container.decodeIfPresent(Int.self, forKey: .ID)
            label = try container.decodeIfPresent(String.self, forKey: .label)
            postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
            state = try container.decodeIfPresent(String.self, forKey: .state)
            streetOne = try container.decodeIfPresent(String.self, forKey: .streetOne)
            streetTwo = try container.decodeIfPresent(String.self, forKey: .streetTwo)
            typeID = try container.decodeIfPresent(Int.self, forKey: .typeID)
            zipPlusFour = try container.decodeIfPresent(String.self, forKey: .zipPlusFour)
        }
    }
}
