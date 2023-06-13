import Foundation

extension Polaris.Patron.ReadingHistory.PatronReadingHistoryGetResponse {
    
    public struct Item: Decodable {
        
        // MARK: - PROPERTIES
        public let item: Int
        public let barcode: String
        public let bib: Int
        public let format: Int
        public let formatDescription: String
        public let title: String
        public let author: String?
        public let callNumber: String
        public let checkOutDate: Date?
        public let loaningBranch: Int
        public let loaningBranchName: String
        public let id: Int

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case item = "ItemID"
            case barcode = "Barcode"
            case bib = "BibID"
            case format = "FormatID"
            case formatDescription = "FormatDescription"
            case title = "Title"
            case author = "Author"
            case callNumber = "CallNumber"
            case checkOutDate = "CheckOutDate"
            case loaningBranch = "LoaningBranchID"
            case loaningBranchName = "LoaningBranchName"
            case id = "PatronReadingHistoryID"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            item = try data.decode(Int.self, forKey: .item)
            barcode = try data.decode(String.self, forKey: .barcode)
            bib = try data.decode(Int.self, forKey: .bib)
            format = try data.decode(Int.self, forKey: .format)
            formatDescription = try data.decode(String.self, forKey: .formatDescription)
            title = try data.decode(String.self, forKey: .title)
            author = try data.decodeIfPresent(String.self, forKey: .author)
            callNumber = try data.decode(String.self, forKey: .callNumber)
            checkOutDate = try data.decode(String.self, forKey: .checkOutDate).toDate()
            loaningBranch = try data.decode(Int.self, forKey: .loaningBranch)
            loaningBranchName = try data.decode(String.self, forKey: .loaningBranchName)
            id = try data.decode(Int.self, forKey: .id)
        }
    }
}
