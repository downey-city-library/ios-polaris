//
//  UpdatePatronRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct UpdatePatronRequest: Encodable {
    
    // MARK: - Typealiases
    public typealias EmailFormat = Patron.EmailFormat
    public typealias Phone = Patron.BasicData.Phone
    
    // MARK: - Public Properties
    public var logonBranchID: Int
    public var logonUserID: Int
    public var logonWorkstationID: Int
    
    public var readingListFlag: Int?
    public var emailFormat: Int?
    public var deliveryOptionID: Int?
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
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case logonBranchID = "LogonBranchID"
        case logonUserID = "LogonUserID"
        case logonWorkstationID = "LogonWorkstationID"
        case readingListFlag = "ReadingListFlag"
        case emailFormat = "EmailFormat"
        case deliveryOptionID = "DeliveryOptionID"
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
    
    // MARK: - Initialization
    public init(logonBranchID: Int, logonUserID: Int, logonWorkstationID: Int, patronBranchID: Int, patron: Patron, password: String? = nil, newBorrowerType: Int? = nil, newPhone1: Phone? = nil, newPhone2: Phone? = nil, newPhone3: Phone? = nil, newEmail1: String? = nil, newEmail2: String? = nil, emailFormat: EmailFormat? = nil, enableSMS: Bool? = nil, deliveryOptionID: Int? = nil) {
        
        // System
        self.logonBranchID = logonBranchID
        self.logonUserID = logonUserID
        self.logonWorkstationID = logonWorkstationID
        
        // Borrower Type
        if let newBorrowerType = newBorrowerType { self.patronCode = newBorrowerType }
        
        // E-Mails
        if let newEmail1 = newEmail1 { self.emailAddress = newEmail1 }
        if let newEmail2 = newEmail2 { self.altEmailAddress = newEmail2 }
        
        // Password / PIN
        if let password = password { self.password = password }
        
        // Phones
        if let newPhone1 = newPhone1 {
            self.phoneVoice1 = newPhone1.number
            if newPhone1.carrier != .noCarrier { self.phone1CarrierID = newPhone1.carrier.id }
        }
        
        if let newPhone2 = newPhone2 {
            self.phoneVoice2 = newPhone2.number
            if newPhone2.carrier != .noCarrier { self.phone2CarrierID = newPhone2.carrier.id }
        }
        
        if let newPhone3 = newPhone3 {
            self.phoneVoice3 = newPhone3.number
            if newPhone3.carrier != .noCarrier { self.phone3CarrierID = newPhone3.carrier.id }
        }
        
        // SMS / TXT Messaging
        if let enableSMS = enableSMS {
            var shouldEnableSMS = false
            if self.txtPhoneNumber != nil { shouldEnableSMS = true }
            else if self.txtPhoneNumber != 0 { shouldEnableSMS = true }
            
            if shouldEnableSMS { self.enableSMS = enableSMS }
        }
        
        // MARK: - Properties Needing Real Values
//        self.addressCheckDate = ""                                                                // FIXME: addressCheckDate
//        if let deliveryOptionID = deliveryOptionID { self.deliveryOptionID = deliveryOptionID }   // FIXME: deliveryOptionID (existing value will come from PatronPreferencesGet)
//        if let emailFormat = emailFormat { self.emailFormat = emailFormat.value }                 // FIXME: emailFormat - existing value will come from PatronPreferencesGet
//        self.eReceiptOptionID = 0                                                                 // FIXME: eReceiptOptionID
//        self.excludeFromAlmostOverdueAutoRenew = false                                            // FIXME: excludeFromAlmostOverdueAutoRenew
//        self.excludeFromInactivePatron = false                                                    // FIXME: excludeFromInactivePatron
//        self.excludeFromPatronRecExpiration = false                                               // FIXME: excludeFromPatronRecExpiration
//        self.expirationDate = ""                                                                  // FIXME: expirationDate
//        self.readingListFlag = 1                                                                  // FIXME: readingListFlag (existing value will come from PatronPreferencesGet)
//        self.txtPhoneNumber = 0                                                                   // FIXME: txtPhoneNumber
    }
}
