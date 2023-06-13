import Foundation

extension Polaris.System.SAMobilePhoneCarriersGetResultResponse {
    
    public struct MobilePhoneCarrier: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let name: String
        public let smsGateway: String
        public let digits: Int
        public let display: Bool
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "CarrierID"
            case name = "CarrierName"
            case smsGateway = "Email2SMSEmailAddress"
            case digits = "NumberOfDigits"
            case display = "Display"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            smsGateway = try container.decode(String.self, forKey: .smsGateway)
            digits = try container.decode(Int.self, forKey: .digits)
            display = try container.decode(Bool.self, forKey: .display)
        }
    }
}
