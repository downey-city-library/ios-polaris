import Foundation

extension Polaris.Patron.PatronHoldRequestsGetResponse {
    
    public struct HoldRequest: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let bib: Int
        public let consituentBib: Int
        public let statusID: Int
        public let statusDescription: String
        public let title: String
        public let author: String?
        public let callNumber: String?
        public let format: Format
        public let pickup: Pickup
        public let queue: Queue
        public let activationDate: Date?
        public let expirationDate: Date?
        public let groupName: String?
        public let itemLevelHold: Bool
        public let borrowByMail: Bool
        public let hasConstituentBib: Bool
        public let newPickupBranchID: Int?
        public let newPickupBranch: String?
        public let innReachType: Int
        public let designation: String?
        public let volumeNumber: String?
        public let PACDisplayNotes: String?
        public let canSuspend: Bool
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "HoldRequestID"
            case bib = "BibID"
            case constituentBib = "ConstituentBibID"
            case statusID = "StatusID"
            case statusDescription = "StatusDescription"
            case title = "Title"
            case author = "Author"
            case callNumber = "CallNumber"
            case activationDate = "ActivationDate"
            case expirationDate = "ExpirationDate"
            case groupName = "GroupName"
            case itemLevelHold = "ItemLevelHold"
            case borrowByMail = "BorrowByMail"
            case hasConstituentBib = "HasConstituentBib"
            case newPickupBranchID = "NewPickupBranchID"
            case newPickupBranch = "NewPickupBranch"
            case innReachType = "InnReachType"
            case designation = "Designation"
            case volumeNumber = "VolumeNumber"
            case PACDisplayNotes = "PACDisplayNotes"
            case canSuspend = "CanSuspend"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            bib = try container.decode(Int.self, forKey: .bib)
            consituentBib = try container.decode(Int.self, forKey: .constituentBib)
            statusID = try container.decode(Int.self, forKey: .statusID)
            statusDescription = try container.decode(String.self, forKey: .statusDescription)
            title = try container.decode(String.self, forKey: .title)
            author = try container.decodeIfPresent(String.self, forKey: .author)
            callNumber = try container.decodeIfPresent(String.self, forKey: .callNumber)
            format = try Format(from: decoder)
            pickup = try Pickup(from: decoder)
            queue = try Queue(from: decoder)
            activationDate = try container.decodeIfPresent(String.self, forKey: .activationDate)?.toDate()
            expirationDate = try container.decodeIfPresent(String.self, forKey: .expirationDate)?.toDate()
            groupName = try container.decodeIfPresent(String.self, forKey: .groupName)
            itemLevelHold = try container.decode(Bool.self, forKey: .itemLevelHold)
            borrowByMail = try container.decode(Bool.self, forKey: .borrowByMail)
            hasConstituentBib = try container.decode(Bool.self, forKey: .hasConstituentBib)
            newPickupBranchID = try container.decodeIfPresent(Int.self, forKey: .newPickupBranchID)
            newPickupBranch = try container.decodeIfPresent(String.self, forKey: .newPickupBranch)
            innReachType = try container.decode(Int.self, forKey: .innReachType)
            designation = try container.decodeIfPresent(String.self, forKey: .designation)
            volumeNumber = try container.decodeIfPresent(String.self, forKey: .volumeNumber)
            PACDisplayNotes = try container.decodeIfPresent(String.self, forKey: .PACDisplayNotes)
            canSuspend = try container.decode(Bool.self, forKey: .canSuspend)
        }
    }
}
