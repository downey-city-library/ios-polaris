import Foundation

extension Polaris.Patron.Registration {
 
    public struct PatronRegistrationCreateRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var branch: Int
        public var user: Int
        public var workstation: Int
        public var patronBranch: Int
        
        public var postalCode: Int = 0
        public var zipPlusFour: String = ""
        public var city: String = ""
        public var state: String = ""
        public var county: String = ""
        public var countryID: Int = 0
        public var streetOne: String = ""
        public var streetTwo: String = ""
        public var nameFirst: String = ""
        public var nameLast: String = ""
        public var nameMiddle: String = ""
        public var user1: String = ""
        public var user2: String = ""
        public var user3: String = ""
        public var user4: String = ""
        public var user5: String = ""
        public var gender: String = ""
        public var birthdate: String = ""
        public var phoneVoice1: String = ""
        public var phoneVoice2: String = ""
        public var phoneVoice3: String = ""
        public var phone1CarrierID: Int = 1
        public var phone2CarrierID: Int = 0
        public var phone3CarrierID: Int = 0
        public var emailAddress: String = ""
        public var altEmailAddress: String = ""
        public var username: String = ""
        public var password: String = ""
        public var password2: String = ""
        public var languageID: Int = 1
        public var deliveryOptionID: Int = 0
        public var enableSMS: Bool = false
        public var txtPhoneNumber: Int = 0
        public var barcode: String = ""
        public var eReceiptOptionID: Int = 0
        public var patronCode: Int = 1
        public var expirationDate: String = ""
        public var addressCheckDate: String = ""
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case branch = "LogonBranchID"
            case user = "LogonUserID"
            case workstation = "LogonWorkstationID"
            case patronBranch = "PatronBranchID"
            
            case postalCode = "PostalCode"
            case zipPlusFour = "ZipPlusFour"
            case city = "City"
            case state = "State"
            case county = "County"
            case countryID = "CountryID"
            case streetOne = "StreetOne"
            case streetTwo = "StreetTwo"
            case nameFirst = "NameFirst"
            case nameLast = "NameLast"
            case nameMiddle = "NameMiddle"
            case user1 = "User1"
            case user2 = "User2"
            case user3 = "User3"
            case user4 = "User4"
            case user5 = "User5"
            case gender = "Gender"
            case birthdate = "Birthdate"
            case phoneVoice1 = "PhoneVoice1"
            case phoneVoice2 = "PhoneVoice2"
            case phoneVoice3 = "PhoneVoice3"
            case phone1CarrierID = "Phone1CarrierID"
            case phone2CarrierID = "Phone2CarrierID"
            case phone3CarrierID = "Phone3CarrierID"
            case emailAddress = "EmailAddress"
            case altEmailAddress = "AltEmailAddress"
            case username = "UserName"
            case password = "Password"
            case password2 = "Password2"
            case languageID = "LanguageID"
            case deliveryOptionID = "DeliveryOptionID"
            case enableSMS = "EnableSMS"
            case txtPhoneNumber = "TxtPhoneNumber"
            case barcode = "Barcode"
            case eReceiptOptionID = "EReceiptOptionID"
            case patronCode = "PatronCode"
            case expirationDate = "ExpirationDate"
            case addressCheckDate = "AddrCheckDate"
        }
        
        // MARK: - INITIALIZATION
        public init(
            branch: Int,
            user: Int,
            workstation: Int,
            patronBranch: Int
        ) {
            self.branch = branch
            self.user = user
            self.workstation = workstation
            self.patronBranch = patronBranch
        }
    }
}
