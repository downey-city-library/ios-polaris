import Foundation

extension Polaris.HoldRequest.HoldRequestGetListResponse {
    
    public struct HoldRequest: Decodable {
        
        // MARK: - PROPERTIES
        public let requestID: Int
        public let statusID: Int
        public let status: String
        public let pickupBranchID: Int
        public let pickupBranch: String
        public let activationDate: Date?
        public let expirationDate: Date?
        public let statusDate: Date?
        public let bibID: Int
        public let constituentBibID: Int
        public let browseAuthor: String?
        public let browseTitle: String
        public let tomID: Int
        public let tom: String
        public let isItemLevelHold: Bool
        public let isBorrowByMail: Bool
        public let patronID: Int
        public let patronBarcode: String
        public let patronBranchID: Int
        public let patronBranch: String
        public let patronFullName: String
        public let patronCodeID: Int
        public let patronCode: String
        public let emailAddress: String?
        public let altEmailAddress: String?
        public let phoneVoice1: String?
        public let smsAddress: String?
        public let itemRecordID: Int
        public let itemBarcode: String?
        public let itemBranchID: Int
        public let itemBranch: String?
        public let callNumber: String?
        public let copyNumber: String?
        public let volumeNumber: String?
        public let pages: String?
        public let assignedCollectionID: Int
        public let collectionName: String?
        public let materialTypeID: Int
        public let materialType: String?
        public let shelfLocationID: Int
        public let shelfLocation: String?
        public let publicationYear: Int
        public let publisher: String?
        public let designation: String?
        public let edition: String?
        public let staffDisplayNotes: String?
        public let nonPublicNotes: String?
        public let PACDisplayNotes: String?
        public let sortTitle: String?
        public let sortAuthor: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case requestID = "SysHoldRequestID"
            case statusID = "SysHoldStatusID"
            case status = "HoldStatus"
            case pickupBranchID = "PickupBranchID"
            case pickupBranch = "PickupBranch"
            case activationDate = "ActivationDate"
            case expirationDate = "ExpirationDate"
            case statusDate = "StatusDate"
            case bibID = "BibliographicRecordID"
            case constituentBibID = "ConstituentBibRecordID"
            case browseAuthor = "BrowseAuthor"
            case browseTitle = "BrowseTitle"
            case tomID = "PrimaryMARCTOMID"
            case tom = "MarcTypeOfMaterial"
            case isItemLevelHold = "ItemLevelHold"
            case isBorrowByMail = "BorrowByMail"
            case patronID = "PatronID"
            case patronBarcode = "PatronBarcode"
            case patronBranchID = "PatronBranchID"
            case patronBranch = "PatronBranch"
            case patronFullName = "PatronFullName"
            case patronCodeID = "PatronCodeID"
            case patronCode = "PatronCode"
            case emailAddress = "EmailAddress"
            case altEmailAddress = "AltEmailAddress"
            case phoneVoice1 = "PhoneVoice1"
            case smsAddress = "SMSAddress"
            case itemRecordID = "ItemRecordID"
            case itemBarcode = "ItemBarcode"
            case itemBranchID = "ItemBranchID"
            case itemBranch = "ItemBranch"
            case callNumber = "CallNumber"
            case copyNumber = "CopyNumber"
            case volumeNumber = "VolumeNumber"
            case pages = "Pages"
            case assignedCollectionID = "AssignedCollectionID"
            case collectionName = "CollectionName"
            case materialTypeID = "MaterialTypeID"
            case materialType = "MaterialType"
            case shelfLocationID = "ShelfLocationID"
            case shelfLocation = "ShelfLocation"
            case publicationYear = "PublicationYear"
            case publisher = "Publisher"
            case designation = "Designation"
            case edition = "Edition"
            case staffDisplayNotes = "StaffDisplayNotes"
            case nonPublicNotes = "NonPublicNotes"
            case PACDisplayNotes = "PACDisplayNotes"
            case sortTitle = "SortTitle"
            case sortAuthor = "SortAuthor"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            requestID = try container.decode(Int.self, forKey: .requestID)
            statusID = try container.decode(Int.self, forKey: .statusID)
            status = try container.decode(String.self, forKey: .status)
            pickupBranchID = try container.decode(Int.self, forKey: .pickupBranchID)
            pickupBranch = try container.decode(String.self, forKey: .pickupBranch)
            activationDate = try container.decodeIfPresent(String.self, forKey: .activationDate)?.toDate()
            expirationDate = try container.decodeIfPresent(String.self, forKey: .expirationDate)?.toDate()
            statusDate = try container.decodeIfPresent(String.self, forKey: .statusDate)?.toDate()
            bibID = try container.decode(Int.self, forKey: .bibID)
            constituentBibID = try container.decode(Int.self, forKey: .constituentBibID)
            browseAuthor = try container.decodeIfPresent(String.self, forKey: .browseAuthor)
            browseTitle = try container.decode(String.self, forKey: .browseTitle)
            tomID = try container.decode(Int.self, forKey: .tomID)
            tom = try container.decode(String.self, forKey: .tom)
            isItemLevelHold = try container.decode(Bool.self, forKey: .isItemLevelHold)
            isBorrowByMail = try container.decode(Bool.self, forKey: .isBorrowByMail)
            patronID = try container.decode(Int.self, forKey: .patronID)
            patronBarcode = try container.decode(String.self, forKey: .patronBarcode)
            patronBranchID = try container.decode(Int.self, forKey: .patronBranchID)
            patronBranch = try container.decode(String.self, forKey: .patronBranch)
            patronFullName = try container.decode(String.self, forKey: .patronFullName)
            patronCodeID = try container.decode(Int.self, forKey: .patronCodeID)
            patronCode = try container.decode(String.self, forKey: .patronCode)
            emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
            altEmailAddress = try container.decodeIfPresent(String.self, forKey: .altEmailAddress)
            phoneVoice1 = try container.decodeIfPresent(String.self, forKey: .phoneVoice1)
            smsAddress = try container.decodeIfPresent(String.self, forKey: .smsAddress)
            itemRecordID = try container.decode(Int.self, forKey: .itemRecordID)
            itemBarcode = try container.decodeIfPresent(String.self, forKey: .itemBarcode)
            itemBranchID = try container.decode(Int.self, forKey: .itemBranchID)
            itemBranch = try container.decodeIfPresent(String.self, forKey: .itemBranch)
            callNumber = try container.decodeIfPresent(String.self, forKey: .callNumber)
            copyNumber = try container.decodeIfPresent(String.self, forKey: .copyNumber)
            volumeNumber = try container.decodeIfPresent(String.self, forKey: .volumeNumber)
            pages = try container.decodeIfPresent(String.self, forKey: .pages)
            assignedCollectionID = try container.decode(Int.self, forKey: .assignedCollectionID)
            collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
            materialTypeID = try container.decode(Int.self, forKey: .materialTypeID)
            materialType = try container.decodeIfPresent(String.self, forKey: .materialType)
            shelfLocationID = try container.decode(Int.self, forKey: .shelfLocationID)
            shelfLocation = try container.decodeIfPresent(String.self, forKey: .shelfLocation)
            publicationYear = try container.decode(Int.self, forKey: .publicationYear)
            publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
            designation = try container.decodeIfPresent(String.self, forKey: .designation)
            edition = try container.decodeIfPresent(String.self, forKey: .edition)
            staffDisplayNotes = try container.decodeIfPresent(String.self, forKey: .staffDisplayNotes)
            nonPublicNotes = try container.decodeIfPresent(String.self, forKey: .nonPublicNotes)
            PACDisplayNotes = try container.decodeIfPresent(String.self, forKey: .PACDisplayNotes)
            sortTitle = try container.decodeIfPresent(String.self, forKey: .sortTitle)
            sortAuthor = try container.decodeIfPresent(String.self, forKey: .sortAuthor)
        }
    }
}
