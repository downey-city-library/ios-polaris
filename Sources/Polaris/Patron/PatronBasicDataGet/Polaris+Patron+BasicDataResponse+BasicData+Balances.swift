import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Balances: Decodable {
        
        // MARK: - PROPERTIES
        public let charges: Double?
        public let credits: Double?
        public let deposits: Double?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case charges = "ChargeBalance"
            case credits = "CreditBalance"
            case deposits = "DepositBalance"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            charges = try container.decodeIfPresent(Double.self, forKey: .charges)
            credits = try container.decodeIfPresent(Double.self, forKey: .credits)
            deposits = try container.decodeIfPresent(Double.self, forKey: .deposits)
        }
    }
}
