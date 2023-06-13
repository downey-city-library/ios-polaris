import Foundation

extension Polaris.Patron.Registration {
    
    public struct PatronRegistrationCreateResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let barcode: String?
        public let patron: Int?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case barcode = "Barcode"
            case patron = "PatronID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            barcode = try container.decodeIfPresent(String.self, forKey: .barcode)
            patron = try container.decodeIfPresent(Int.self, forKey: .patron)
        }
    }
}
