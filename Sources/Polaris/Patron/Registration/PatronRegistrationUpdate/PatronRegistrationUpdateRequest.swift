import Foundation

extension Polaris.Patron.Registration {
    
    public struct PatronRegistrationUpdateRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var branch: Int
        public var user: Int
        public var workstation: Int
        
        public var readingListFlag: Int?
        public var emailFormat: Int?
        public var deliveryOptionID: Int?
        public var deliveryOption: Int?
        public var emailAddress: String?
        public var phoneVoice1: String?
        public var password: String?
        public var altEmailAddress: String?
        public var enableSMS: Bool?
        public var phoneVoice2: String?
        public var phoneVoice3: String?
        public var phone1CarrierID: Int?
        public var phone2CarrierID: Int?
        public var phone3CarrierID: Int?
        public var txtPhoneNumber: Int?
        public var eReceiptOptionID: Int?
        public var excludeFromAlmostOverdueAutoRenew: Bool?
        public var excludeFromPatronRecExpiration: Bool?
        public var excludeFromInactivePatron: Bool?
        public var expirationDate: String?
        public var addressCheckDate: String?
        public var patronCode: Int?
        
        // Properties involving the address are commented out at this time because
        // they don't appear to make any direct changes to the patron account, rather
        // an email is sent a staff member and a block is placed on the patron record.
        
    //    public var addressID: Int
    //    public var freeTextLabel: String
    //    public var streetOne: String = ""
    //    public var state: String = ""
    //    public var county: String = ""
    //    public var postalCode: Int = 0
    //    public var country: String = ""
    //    public var addressTypeID: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case branch = "LogonBranchID"
            case user = "LogonUserID"
            case workstation = "LogonWorkstationID"
            
            case readingListFlag = "ReadingListFlag"
            case emailFormat = "EmailFormat"
            case deliveryOptionID = "DeliveryOptionID"
            case deliveryOption = "DeliveryOption"
            case emailAddress = "EmailAddress"
            case phoneVoice1 = "PhoneVoice1"
            case password = "Password"
            case altEmailAddress = "AltEmailAddress"
            case enableSMS = "EnableSMS"
            case phoneVoice2 = "PhoneVoice2"
            case phoneVoice3 = "PhoneVoice3"
            case phone1CarrierID = "Phone1CarrierID"
            case phone2CarrierID = "Phone2CarrierID"
            case phone3CarrierID = "Phone3CarrierID"
            case txtPhoneNumber = "TxtPhoneNumber"
            case eReceiptOptionID = "EReceiptOptionID"
            case excludeFromAlmostOverdueAutoRenew = "ExcludeFromAlmostOverdueAutoRenew"
            case excludeFromPatronRecExpiration = "ExcludeFromPatronRecExpiration"
            case excludeFromInactivePatron = "ExcludeFromInactivePatron"
            case expirationDate = "ExpirationDate"
            case addressCheckDate = "AddrCheckDate"
            case patronCode = "PatronCode"
            
            // Address fields are commented out. See the comment above.
    //        case addressID = "AddressID"
    //        case freeTextLabel = "FreeTextLabel"
    //        case streetOne = "StreetOne"
    //        case state = "State"
    //        case county = "County"
    //        case postalCode = "PostalCode"
    //        case country = "Country"
    //        case addressTypeID = "AddressTypeID"
        }
        
        // MARK: - INITIALIZATION
        public init(
            branch: Int,
            user: Int,
            workstation: Int,
//            patronBranch: Int,
            password: String? = nil,
            newBorrowerType: Int? = nil,
            phoneVoice1: String? = nil,
            phoneVoice2: String? = nil,
            phoneVoice3: String? = nil,
            phoneCarrier1: Int? = nil,
            phoneCarrier2: Int? = nil,
            phoneCarrier3: Int? = nil,
            newEmail1: String? = nil,
            newEmail2: String? = nil,
            emailFormat: EmailFormat? = nil,
            enableSMS: Bool? = nil,
            deliveryOptionID: Int? = nil) {
            
            // System
            self.branch = branch
            self.user = user
            self.workstation = workstation
            
            // Borrower Type
            if let newBorrowerType = newBorrowerType { self.patronCode = newBorrowerType }
            
            // E-Mails
            if let newEmail1 = newEmail1 { self.emailAddress = newEmail1 }
            if let newEmail2 = newEmail2 { self.altEmailAddress = newEmail2 }
            
            // Password / PIN
            if let password = password { self.password = password }
            
            // Phones
            if let phoneVoice1 = phoneVoice1 { self.phoneVoice1 = phoneVoice1 }
            if let phoneVoice2 = phoneVoice2 { self.phoneVoice2 = phoneVoice2 }
            if let phoneVoice3 = phoneVoice3 { self.phoneVoice3 = phoneVoice3 }
            
            // Carriers
            if let phoneCarrier1 = phoneCarrier1 { self.phone1CarrierID = phoneCarrier1 }
            if let phoneCarrier2 = phoneCarrier2 { self.phone2CarrierID = phoneCarrier2 }
            if let phoneCarrier3 = phoneCarrier3 { self.phone3CarrierID = phoneCarrier3 }
            
            // SMS / TXT Messaging
            if let enableSMS = enableSMS {
                var shouldEnableSMS = false
                if self.txtPhoneNumber != nil { shouldEnableSMS = true }
                else if self.txtPhoneNumber != 0 { shouldEnableSMS = true }
                
                if shouldEnableSMS { self.enableSMS = enableSMS }
            }
        }
    }
}
