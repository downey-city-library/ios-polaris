import Foundation

extension Polaris.Patron.PatronItemsOutGetResponse {

    public struct Item: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let barcode: String
        public let bibID: Int
        public let formatID: Int
        public let formatDescription: String
        public let title: String
        public let author: String?
        public let callNumber: String
        public let checkoutDate: Date?
        public let dueDate: Date?
        public let renewalCount: Int
        public let renewalLimit: Int
        public let assignedBranchID: Int
        public let assignedBranchName: String
        public let loaningBranchID: Int
        public let loaningBranchName: String
        public let billingNoticeSent: Bool
        public let replacementChargeTransactionID: Int
        public let processingChargeTransactionID: Int
        public let overdueChargeTransactionID: Int
        public let displayInPAC: Bool
        public let electronicItem: Bool
        public let vendorName: String?
        public let vendorAccountName: String?
        public let vendorObjectIdentifier: Int?
        public let ISBN: [String]?
        public let ISSN: String?
        public let OCLC: String?
        public let UPC: String?
        public let canItemBeRenewed: Bool
        public let designation: String?
        public let volumeNumber: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "ItemID"
            case barcode = "Barcode"
            case bibID = "BibID"
            case formatID = "FormatID"
            case formatDescription = "FormatDescription"
            case title = "Title"
            case author = "Author"
            case callNumber = "CallNumber"
            case checkoutDate = "CheckOutDate"
            case dueDate = "DueDate"
            case renewalCount = "RenewalCount"
            case renewalLimit = "RenewalLimit"
            case assignedBranchID = "AssignedBranchID"
            case assignedBranchName = "AssignedBranchName"
            case loaningBranchID = "LoaningBranchID"
            case loaningBranchName = "LoaningBranchName"
            case billingNoticeSent = "BillingNoticeSent"
            case replacementChargeTransactionID = "ReplacementChargeTxnID"
            case processingChargeTransactionID = "ProcessingChargeTxnID"
            case overdueChargeTransactionID = "OverdueChargeTxnID"
            case displayInPAC = "DisplayInPAC"
            case electronicItem = "ElectronicItem"
            case vendorName = "VendorName"
            case vendorAccountName = "VendorAccountName"
            case vendorObjectIdentifier = "VendorObjectIdentifier"
            case ISBN = "ISBN"
            case ISSN = "ISSN"
            case OCLC = "OCLCNumber"
            case UPC = "UPCNumber"
            case canItemBeRenewed = "CanItemBeRenewed"
            case designation = "Designation"
            case volumeNumber = "VolumeNumber"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            barcode = try container.decode(String.self, forKey: .barcode)
            bibID = try container.decode(Int.self, forKey: .bibID)
            formatID = try container.decode(Int.self, forKey: .formatID)
            formatDescription = try container.decode(String.self, forKey: .formatDescription)
            title = try container.decode(String.self, forKey: .title)
            author = try container.decodeIfPresent(String.self, forKey: .author)
            callNumber = try container.decode(String.self, forKey: .callNumber)
            checkoutDate = try container.decodeIfPresent(String.self, forKey: .checkoutDate)?.toDate()
            dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate)?.toDate()
            renewalCount = try Int(container.decode(String.self, forKey: .renewalCount)) ?? 0
            renewalLimit = try Int(container.decode(String.self, forKey: .renewalLimit)) ?? 0
            assignedBranchID = try container.decode(Int.self, forKey: .assignedBranchID)
            assignedBranchName = try container.decode(String.self, forKey: .assignedBranchName)
            loaningBranchID = try container.decode(Int.self, forKey: .loaningBranchID)
            loaningBranchName = try container.decode(String.self, forKey: .loaningBranchName)
            billingNoticeSent = try Bool(truncating: container.decode(Int.self, forKey: .billingNoticeSent) as NSNumber)
            replacementChargeTransactionID = try container.decode(Int.self, forKey: .replacementChargeTransactionID)
            processingChargeTransactionID = try container.decode(Int.self, forKey: .processingChargeTransactionID)
            overdueChargeTransactionID = try container.decode(Int.self, forKey: .overdueChargeTransactionID)
            displayInPAC = try Bool(truncating: container.decode(Int.self, forKey: .displayInPAC) as NSNumber)
            electronicItem = try container.decode(Bool.self, forKey: .electronicItem)
            vendorName = try container.decodeIfPresent(String.self, forKey: .vendorName)
            vendorAccountName = try container.decodeIfPresent(String.self, forKey: .vendorAccountName)
            vendorObjectIdentifier = try container.decodeIfPresent(Int.self, forKey: .vendorObjectIdentifier)
            ISBN = try container.decodeIfPresent([String].self, forKey: .ISBN)
            ISSN = try container.decodeIfPresent(String.self, forKey: .ISSN)
            OCLC = try container.decodeIfPresent(String.self, forKey: .OCLC)
            UPC = try container.decodeIfPresent(String.self, forKey: .UPC)
            canItemBeRenewed = try container.decode(Bool.self, forKey: .canItemBeRenewed)
            designation = try container.decodeIfPresent(String.self, forKey: .designation)
            volumeNumber = try container.decodeIfPresent(String.self, forKey: .volumeNumber)
        }
    }
}
