import Foundation

extension Polaris.Patron.BasicDataResponse {
    
    public struct BasicData: Decodable {
                        
        // MARK: - PROPERTIES
        public let addressCheckDate: Date?
        public let addresses: [Address]
        public let balances: Balances
        public let barcode: String?
        public let birthdate: Date?
        public let emails: Emails
        public let holdRequestCounts: HoldRequestCounts
        public let id: Int?
        public let itemCounts: ItemCounts
        public let lastActivityDate: Date?
        public let messageCounts: MessageCounts
        public let name: Name
        public let phones: Phones
        public let registrationDate: Date?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case addressCheckDate = "AddrCheckDate"
            case addresses = "PatronAddresses"
            case barcode = "Barcode"
            case birthdate = "BirthDate"
            case id = "PatronID"
            case lastActivityDate = "LastActivityDate"
            case registrationDate = "RegistrationDate"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            addressCheckDate = try container.decodeIfPresent(String.self, forKey: .addressCheckDate)?.toDate()
            addresses = try container.decode([Address].self, forKey: .addresses)
            balances = try Balances(from: decoder)
            barcode = try container.decodeIfPresent(String.self, forKey: .barcode)
            birthdate = try container.decodeIfPresent(String.self, forKey: .birthdate)?.toDate()
            emails = try Emails(from: decoder)
            holdRequestCounts = try HoldRequestCounts(from: decoder)
            id = try container.decodeIfPresent(Int.self, forKey: .id)
            itemCounts = try ItemCounts(from: decoder)
            lastActivityDate = try container.decodeIfPresent(String.self, forKey: .lastActivityDate)?.toDate()
            messageCounts = try MessageCounts(from: decoder)
            name = try Name(from: decoder)
            phones = try Phones(from: decoder)
            registrationDate = try container.decodeIfPresent(String.self, forKey: .registrationDate)?.toDate()
        }
    }
}
