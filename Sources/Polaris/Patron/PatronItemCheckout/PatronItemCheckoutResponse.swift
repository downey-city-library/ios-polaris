import Foundation

extension Polaris.Patron {
    
    public struct PatronItemCheckoutResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let recordID: Int
        public let isRenewal: Bool
        public let dueDate: Date?
        public let chargeAmount: Double
        public let patronFlags: Int
        public let itemFlags: Int
        public let renewalFlags: Int
        public let materialTypeID: Int
        public let selfcheckMediaID: Int
        public let isMagnetic: Bool
        public let canDesensitize: Bool
        public let doubleSided: Bool
        public let unlocker: Bool
        public let mediaFormatID: Int
        public let title: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case recordID = "ItemRecordID"
            case isRenewal = "IsRenewal"
            case dueDate = "DueDate"
            case chargeAmount = "ChargeAmount"
            case patronFlags = "PatronBlockFlags"
            case itemFlags = "ItemBlockFlags"
            case renewalFlags = "RenewalBlockFlags"
            case materialTypeID = "MaterialTypeID"
            case selfcheckMediaID = "SelfCheckMediaTypeID"
            case isMagnetic = "IsMagnetic"
            case canDesensitize = "CanDesensitize"
            case doubleSided = "DoubleSided"
            case unlocker = "Unlocker"
            case mediaFormatID = "DDM_MediaFormatID"
            case title = "Title"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            recordID = try container.decode(Int.self, forKey: .recordID)
            isRenewal = try container.decode(Bool.self, forKey: .isRenewal)
            dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate)?.toDate()
            chargeAmount = try container.decode(Double.self, forKey: .chargeAmount)
            patronFlags = try container.decode(Int.self, forKey: .patronFlags)
            itemFlags = try container.decode(Int.self, forKey: .itemFlags)
            renewalFlags = try container.decode(Int.self, forKey: .renewalFlags)
            materialTypeID = try container.decode(Int.self, forKey: .materialTypeID)
            selfcheckMediaID = try container.decode(Int.self, forKey: .selfcheckMediaID)
            isMagnetic = try container.decode(Bool.self, forKey: .isMagnetic)
            canDesensitize = try container.decode(Bool.self, forKey: .canDesensitize)
            doubleSided = try container.decode(Bool.self, forKey: .doubleSided)
            unlocker = try container.decode(Bool.self, forKey: .unlocker)
            mediaFormatID = try container.decode(Int.self, forKey: .mediaFormatID)
            title = try container.decode(String.self, forKey: .title)
        }
    }
}
