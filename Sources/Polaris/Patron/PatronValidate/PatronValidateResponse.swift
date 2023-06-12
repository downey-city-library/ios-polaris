import Foundation

extension Polaris.Patron {
    
    public struct PatronValidateResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let barcode: String
        public let validPatron: Bool
        public let id: Int
        public let assignedBranchID: Int
        public let patronBarcode: String
        public let assignedBranchName: String
        public let expirationDate: Date?
        public let overridePasswordUsed: Bool
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case barcode = "Barcode"
            case validPatron = "ValidPatron"
            case id = "PatronID"
            case assignedBranchID = "AssignedBranchID"
            case patronBarcode = "PatronBarcode"
            case assignedBranchName = "AssignedBranchName"
            case expirationDate = "ExpirationDate"
            case overridePasswordUsed = "OverridePasswordUsed"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            barcode = try container.decode(String.self, forKey: .barcode)
            validPatron = try container.decode(Bool.self, forKey: .validPatron)
            id = try container.decode(Int.self, forKey: .id)
            assignedBranchID = try container.decode(Int.self, forKey: .assignedBranchID)
            patronBarcode = try container.decode(String.self, forKey: .patronBarcode)
            assignedBranchName = try container.decode(String.self, forKey: .assignedBranchName)
            expirationDate = try container.decodeIfPresent(String.self, forKey: .expirationDate)?.toDate()
            overridePasswordUsed = try container.decode(Bool.self, forKey: .overridePasswordUsed)
        }
    }

}
