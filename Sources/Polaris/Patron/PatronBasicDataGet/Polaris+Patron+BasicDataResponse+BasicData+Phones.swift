import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Phones: Decodable {
        
        // MARK: - PROPERTIES
        public var cell: String?
        public var phone1: Phone
        public var phone2: Phone
        public var phone3: Phone
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case carrier1 = "Phone1CarrierID"
            case carrier2 = "Phone2CarrierID"
            case carrier3 = "Phone3CarrierID"
            case cell = "CellPhone"
            case number1 = "PhoneNumber"
            case number2 = "PhoneNumber2"
            case number3 = "PhoneNumber3"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            cell = try container.decodeIfPresent(String.self, forKey: .cell)
            
            let carrier1 = try container.decodeIfPresent(Int.self, forKey: .carrier1)
            let carrier2 = try container.decodeIfPresent(Int.self, forKey: .carrier2)
            let carrier3 = try container.decodeIfPresent(Int.self, forKey: .carrier3)
            
            let number1 = try container.decodeIfPresent(String.self, forKey: .number1)
            let number2 = try container.decodeIfPresent(String.self, forKey: .number2)
            let number3 = try container.decodeIfPresent(String.self, forKey: .number3)
            
            phone1 = Phone(number: number1, carrier: carrier1)
            phone2 = Phone(number: number2, carrier: carrier2)
            phone3 = Phone(number: number3, carrier: carrier3)
        }
    }
}
