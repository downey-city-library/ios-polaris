import Foundation

extension Polaris.Patron.Registration {
 
    public struct PatronRegistrationCreateRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var branch: Int
        public var user: Int
        public var workstation: Int
        public var patronBranch: Int
        
        public var postalCode: String = ""
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
        public var phone1CarrierID: Int?
        public var phone2CarrierID: Int?
        public var phone3CarrierID: Int?
        public var emailAddress: String = ""
        public var altEmailAddress: String = ""
        public var username: String = ""
        public var password: String = ""
        public var password2: String = ""
        public var languageID: Int = 1
        public var deliveryOptionID: Int = 0
        public var enableSMS: Bool = false
        public var txtPhoneNumber: Int?
        public var barcode: String = ""
        public var eReceiptOptionID: Int?
        public var patronCode: Int
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
            patronBranch: Int,
            postalCode: String,
            zipPlusFour: String = "",
            city: String,
            state: String,
            county: String,
            countryID: Int,
            streetOne: String,
            streetTwo: String = "",
            nameFirst: String,
            nameLast: String,
            nameMiddle: String = "",
            user1: String = "",
            user2: String = "",
            user3: String = "",
            user4: String = "",
            user5: String = "",
            gender: String,
            birthdate: String,
            phoneVoice1: String,
            phoneVoice2: String = "",
            phoneVoice3: String = "",
            phone1CarrierID: Int?,
            phone2CarrierID: Int? = nil,
            phone3CarrierID: Int? = nil,
            emailAddress: String,
            altEmailAddress: String = "",
            username: String = "",
            password: String,
            password2: String,
            languageID: Int = 1,
            deliveryOptionID: Int,
            enableSMS: Bool,
            txtPhoneNumber: Int?,
            barcode: String,
            eReceiptOptionID: Int?,
            patronCode: Int,
            expirationDate: String,
            addressCheckDate: String
        ) {
            self.branch = branch
            self.user = user
            self.workstation = workstation
            self.patronBranch = patronBranch
            self.postalCode = postalCode
            self.zipPlusFour = zipPlusFour
            self.city = city
            self.state = state
            self.county = county
            self.countryID = countryID
            self.streetOne = streetOne
            self.streetTwo = streetTwo
            self.nameFirst = nameFirst
            self.nameLast = nameLast
            self.nameMiddle = nameMiddle
            self.user1 = user1
            self.user2 = user2
            self.user3 = user3
            self.user4 = user4
            self.user5 = user5
            self.gender = gender
            self.birthdate = birthdate
            self.phoneVoice1 = phoneVoice1
            self.phoneVoice2 = phoneVoice2
            self.phoneVoice3 = phoneVoice3
            self.phone1CarrierID = phone1CarrierID
            self.phone2CarrierID = phone2CarrierID
            self.phone3CarrierID = phone3CarrierID
            self.emailAddress = emailAddress
            self.altEmailAddress = altEmailAddress
            self.username = username
            self.password = password
            self.password2 = password2
            self.languageID = languageID
            self.deliveryOptionID = deliveryOptionID
            self.enableSMS = enableSMS
            self.txtPhoneNumber = txtPhoneNumber
            self.barcode = barcode
            self.eReceiptOptionID = eReceiptOptionID
            self.patronCode = patronCode
            self.expirationDate = expirationDate
            self.addressCheckDate = addressCheckDate
        }
    }
}
