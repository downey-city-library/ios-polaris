//
//  UpdatePatronRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct UpdatePatronRequest: Encodable {
    public var logonBranchID: Int
    public var logonUserID: Int
    public var logonWorkstationID: Int
    public var readingListFlag: Int = 0
    public var emailFormat: Int = 0
    public var deliveryOptionID: Int = 0
    public var emailAddress: String = ""
    public var phoneVoice1: String = ""
    public var password: String = ""
    public var altEmailAddress: String = ""
    public var enableSMS: Bool = false
    public var phoneVoice2: String = ""
    public var phoneVoice3: String = ""
    public var phone1CarrierID: Int = 1
    public var phone2CarrierID: Int = 0
    public var phone3CarrierID: Int = 0
    public var txtPhoneNumber: Int = 0
    public var eReceiptOptionID: Int = 0
    public var excludeFromAlmostOverdueAutoRenew: Bool
    public var excludeFromPatronRecExpiration: Bool
    public var excludeFromInactivePatron: Bool
    public var expirationDate: String = ""
    public var addressCheckDate: String = ""
    public var patronCode: Int = 1
    
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
    
    fileprivate enum CodingKeys: String, CodingKey {
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
        
//        case addressID = "AddressID"
//        case freeTextLabel = "FreeTextLabel"
//        case streetOne = "StreetOne"
//        case state = "State"
//        case county = "County"
//        case postalCode = "PostalCode"
//        case country = "Country"
//        case addressTypeID = "AddressTypeID"
    }
    
    public init(logonBranchID: Int, logonUserID: Int, logonWorkstationID: Int, patronBranchID: Int, patron: Patron, password: String, newPhone1: Patron.Phone?, newPhone2: Patron.Phone?, newPhone3: Patron.Phone?, newEmail1: Patron.Email?, newEmail2: Patron.Email?, emailFormat: EmailFormat?, enableSMS: Bool?) {
        // System
        self.logonBranchID = logonBranchID
        self.logonUserID = logonUserID
        self.logonWorkstationID = logonWorkstationID
        
        self.excludeFromAlmostOverdueAutoRenew = false // FIXME: Needs real value
        self.excludeFromInactivePatron = false // FIXME: Needs real value
        self.excludeFromPatronRecExpiration = false // FIXME: Needs real value
        
        // Patron
        self.password = password
        self.patronCode = 1 // FIXME: Needs real value
        self.readingListFlag = 1 // FIXME: Needs real value
        
        // Dates
        self.addressCheckDate = "" // FIXME: Needs real value
        self.expirationDate = "" // FIXME: Needs real value

        // Notifications
        self.deliveryOptionID = 2 // FIXME: Needs real value
        self.eReceiptOptionID = 0 // FIXME: Needs real value
        
        // E-Mails
        if let newEmail1 = newEmail1 { self.emailAddress = newEmail1.address }
        else { self.emailAddress = patron.emails[0].address }
        
        if let newEmail2 = newEmail2 { self.altEmailAddress = newEmail2.address }
        else { self.altEmailAddress = patron.emails[1].address }
        
        if let emailFormat = emailFormat { self.emailFormat = emailFormat.value }
        
        // Phones
        if let newPhone1 = newPhone1 {
            self.phoneVoice1 = newPhone1.number
            self.phone1CarrierID = newPhone1.carrier.id
        } else {
            self.phoneVoice1 = "(562) 904-7367"
            self.phone1CarrierID = patron.phones[0].carrier.id
        }
        
        if let newPhone2 = newPhone2 {
            self.phoneVoice2 = newPhone2.number
            self.phone2CarrierID = newPhone2.carrier.id
        } else {
            self.phoneVoice2 = patron.phones[1].number
            self.phone2CarrierID = patron.phones[1].carrier.id
        }
        
        if let newPhone3 = newPhone3 {
            self.phoneVoice3 = newPhone3.number
            self.phone3CarrierID = newPhone3.carrier.id
        } else {
            self.phoneVoice3 = patron.phones[2].number
            self.phone3CarrierID = patron.phones[2].carrier.id
        }
        
        if let enableSMS = enableSMS { self.enableSMS = enableSMS }
        
        self.txtPhoneNumber = 0 // FIXME: Needs real value
    }
}

public enum DeliveryOption: Int {
    case none = 0
    case mailingAddress = 1
    case emailAddress = 2
    case telephone1 = 3
    case telephone2 = 4
    case telephone3 = 5
    case fax = 6
    case edi = 7
    case txt = 8
}

public enum EmailFormat: Int {
    case plainText = 1
    case html = 2
    
    var value: Int { return self.rawValue }
}

public enum EReceiptOption: Int {
    case none = 0
    case email = 2
    case txt = 8
}

public enum ReadingListFlag: Int {
    case enabled = 1
    case disabled = 0
}
