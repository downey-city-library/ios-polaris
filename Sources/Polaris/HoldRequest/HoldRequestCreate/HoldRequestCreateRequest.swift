import Foundation

extension Polaris.HoldRequest {
 
    public struct HoldRequestCreateRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let bib: Int
        public let patron: Int
        public let pickupOrganization: Int
        public let requestingOrganization: Int
        public let user: Int
        public let workstation: Int
        public let activationDate: String?
        public let designation: Bool?
        public let isBorrowByMail: Bool?
        public let itemBarcode: String?
        public let patronNotes: String?
        public let guid: Int?
        public let volume: Int?
            
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case patron = "PatronID"
            case bib = "BibID"
            case itemBarcode = "ItemBarcode"
            case volume = "VolumeNumber"
            case designation = "Designation"
            case pickupOrganization = "PickupOrgID"
            case isBorrowByMail = "IsBorrowByMail"
            case patronNotes = "PatronNotes"
            case activationDate = "ActivationDate"
            case workstation = "WorkstationID"
            case user = "UserID"
            case requestingOrganization = "RequestingOrgID"
            case guid = "TargetGUID"
        }
        
        // MARK: - INITIALIZATION
        public init(
            bib: Int,
            patron: Int,
            pickupOrganization: Int = 0,
            requestingOrganization: Int,
            user: Int,
            workstation: Int,
            activationDate: Date? = nil,
            designation: Bool? = nil,
            isBorrowByMail: Bool? = nil,
            itemBarcode: String? = nil,
            patronNotes: String? = nil,
            guid: Int? = nil,
            volume: Int? = nil
        ) {
            self.bib = bib
            self.patron = patron
            self.pickupOrganization = pickupOrganization
            self.requestingOrganization = requestingOrganization
            self.user = user
            self.workstation = workstation
            self.activationDate = activationDate?.ISO8601Format()
            self.designation = designation
            self.isBorrowByMail = isBorrowByMail
            self.itemBarcode = itemBarcode
            self.patronNotes = patronNotes
            self.guid = guid
            self.volume = volume
        }
    }
}
