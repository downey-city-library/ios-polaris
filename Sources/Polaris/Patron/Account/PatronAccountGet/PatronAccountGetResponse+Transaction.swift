import Foundation

extension Polaris.Patron.Account.PatronAccountGetResponse {
    
    public struct Transaction: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let date: Date?
        public let branchID: Int
        public let branchName: String
        public let typeID: Int
        public let typeDescription: String
        public let feeDescription: String?
        public let amount: Double
        public let outstandingAmount: Double
        public let freeTextNote: String?
        public let itemID: Int
        public let barcode: String?
        public let bibID: Int
        public let formatID: Int
        public let formatDescription: String?
        public let title: String?
        public let author: String?
        public let callNumber: String?
        public let checkOutDate: Date?
        public let dueDate: Date?

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case transactionID = "TransactionID"
            case transactionDate = "TransactionDate"
            case branchID = "BranchID"
            case branchName = "BranchName"
            case transactionTypeID = "TransactionTypeID"
            case transactionTypeDescription = "TransactionTypeDescription"
            case feeDescription = "FeeDescription"
            case transactionAmount = "TransactionAmount"
            case outstandingAmount = "OutstandingAmount"
            case freeTextNote = "FreeTextNote"
            case itemID = "ItemID"
            case barcode = "Barcode"
            case bibID = "BibID"
            case formatID = "FormatID"
            case formatDescription = "FormatDescription"
            case title = "Title"
            case author = "Author"
            case callNumber = "CallNumber"
            case checkOutDate = "CheckOutDate"
            case dueDate = "DueDate"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(Int.self, forKey: .transactionID)
            self.date = try container.decode(String.self, forKey: .transactionDate).toDate()
            self.branchID = try container.decode(Int.self, forKey: .branchID)
            self.branchName = try container.decode(String.self, forKey: .branchName)
            self.typeID = try container.decode(Int.self, forKey: .transactionTypeID)
            self.typeDescription = try container.decode(String.self, forKey: .transactionTypeDescription)
            self.feeDescription = try container.decodeIfPresent(String.self, forKey: .feeDescription)
            self.amount = try container.decode(Double.self, forKey: .transactionAmount)
            self.outstandingAmount = try container.decode(Double.self, forKey: .outstandingAmount)
            self.freeTextNote = try container.decodeIfPresent(String.self, forKey: .freeTextNote)
            self.itemID = try container.decode(Int.self, forKey: .itemID)
            self.barcode = try container.decodeIfPresent(String.self, forKey: .barcode)
            self.bibID = try container.decode(Int.self, forKey: .bibID)
            self.formatID = try container.decode(Int.self, forKey: .formatID)
            self.formatDescription = try container.decodeIfPresent(String.self, forKey: .formatDescription)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.author = try container.decodeIfPresent(String.self, forKey: .author)
            self.callNumber = try container.decodeIfPresent(String.self, forKey: .callNumber)
            self.checkOutDate = try container.decodeIfPresent(String.self, forKey: .checkOutDate)?.toDate()
            self.dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate)?.toDate()
        }
    }
}
