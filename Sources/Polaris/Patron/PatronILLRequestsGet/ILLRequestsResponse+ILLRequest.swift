import Foundation

extension Polaris.Patron.PatronILLRequestsGetResponse {
    
    public struct ILLRequest: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let illStatusID: Int
        public let patronID: Int
        public let itemRecordID: Int
        public let bibRecordID: Int
        public let pickupBranchID: Int
        public let author: String?
        public let title: String
        public let format: String
        public let creationDate: Date?
        public let activationDate: Date?
        public let status: String
        public let item: String
        public let needByDate: Date?
        public let pickupBranch: String
        public let formatID: Int
        public let lastStatusTransitionDate: Date?
        public let opacNotes: String?
        public let callNumber: String
        public let volumeAndIssue: String?
        public let pickupByDate: Date?
        public let innReachTrackingID: Int
        
        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case id = "ILLRequestID"
            case illStatusID = "ILLStatusID"
            case patronID = "PatronID"
            case itemRecordID = "ItemRecordID"
            case bibRecordID = "BibRecordID"
            case pickupBranchID = "PickupBranchID"
            case author = "Author"
            case title = "Title"
            case format = "Format"
            case creationDate = "CreationDate"
            case activationDate = "ActivationDate"
            case status = "Status"
            case item = "Item"
            case needByDate = "NeedByDate"
            case pickupBranch = "PickupBranch"
            case formatID = "FormatID"
            case lastStatusTransitionDate = "LastStatusTransitionDate"
            case opacNotes = "OpacNotes"
            case callNumber = "CallNumber"
            case volumeAndIssue = "VolumeAndIssue"
            case pickupByDate = "PickupByDate"
            case innReachTrackingID = "InnReachTrackingID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            illStatusID = try container.decode(Int.self, forKey: .illStatusID)
            patronID = try container.decode(Int.self, forKey: .patronID)
            itemRecordID = try container.decode(Int.self, forKey: .itemRecordID)
            bibRecordID = try container.decode(Int.self, forKey: .bibRecordID)
            pickupBranchID = try container.decode(Int.self, forKey: .pickupBranchID)
            author = try container.decodeIfPresent(String.self, forKey: .author)
            title = try container.decode(String.self, forKey: .title)
            format = try container.decode(String.self, forKey: .format)
            creationDate = try container.decode(String.self, forKey: .creationDate).toDate()
            activationDate = try container.decode(String.self, forKey: .activationDate).toDate()
            status = try container.decode(String.self, forKey: .status)
            item = try container.decode(String.self, forKey: .item)
            needByDate = try container.decode(String.self, forKey: .needByDate).toDate()
            pickupBranch = try container.decode(String.self, forKey: .pickupBranch)
            formatID = try container.decode(Int.self, forKey: .formatID)
            lastStatusTransitionDate = try container.decode(String.self, forKey: .lastStatusTransitionDate).toDate()
            opacNotes = try container.decodeIfPresent(String.self, forKey: .opacNotes)
            callNumber = try container.decode(String.self, forKey: .callNumber)
            volumeAndIssue = try container.decodeIfPresent(String.self, forKey: .volumeAndIssue)
            pickupByDate = try container.decodeIfPresent(String.self, forKey: .pickupByDate)?.toDate()
            innReachTrackingID = try container.decode(Int.self, forKey: .innReachTrackingID)
        }
    }
}
