import Foundation

extension Polaris.Patron.Blocks {
    
    public struct PatronCirculateBlocksGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let assignedBranchId: Int
        public let assignedBranchName: String
        public let barcode: String
        public let blocks: [Block]
        public let canCirculate: Bool
        public let emailAddress: String?
        public let expirationDate: Date?
        public let isValid: Bool
        public let name: Name
        public let overridePasswordUsed: Bool
        public let patronBarcode: String
        public let patronCode: Int
        public let patronId: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case assignedBranchId = "AssignedBranchID"
            case assignedBranchName = "AssignedBranchName"
            case barcode = "Barcode"
            case blocks = "Blocks"
            case canCirculate = "CanPatronCirculate"
            case emailAddress = "EmailAddress"
            case expirationDate = "ExpirationDate"
            case isValid = "ValidPatron"
            case overridePasswordUsed = "OverridePasswordUsed"
            case patronBarcode = "PatronBarcode"
            case patronCode = "PatronCodeID"
            case patronId = "PatronID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            assignedBranchId = try container.decode(Int.self, forKey: .assignedBranchId)
            assignedBranchName = try container.decode(String.self, forKey: .assignedBranchName)
            barcode = try container.decode(String.self, forKey: .barcode)
            blocks = try container.decode([Block].self, forKey: .blocks)
            canCirculate = try container.decode(Bool.self, forKey: .canCirculate)
            emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
            expirationDate = try container.decode(String.self, forKey: .expirationDate).toDate()
            isValid = try container.decode(Bool.self, forKey: .isValid)
            name = try Name(from: decoder)
            overridePasswordUsed = try container.decode(Bool.self, forKey: .overridePasswordUsed)
            patronBarcode = try container.decode(String.self, forKey: .patronBarcode)
            patronCode = try container.decode(Int.self, forKey: .patronCode)
            patronId = try container.decode(Int.self, forKey: .patronId)
        }
    }
}
