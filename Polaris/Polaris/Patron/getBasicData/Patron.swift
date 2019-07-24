//
//  Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct Patron {
    public let barcode: String
    public let name: Name
    public let phones: [Phone]
    public let emails: [Email]
    public let birthdate: Date?
    public let registrationDate: Date?
    public let lastActivityDate: Date?
    public let addressCheckDate: Date?
    public let messageCounts: MessageCounts
    public let addresses: [Address]
    public let itemCounts: ItemCounts
    public let holdRequestCounts: HoldRequestCounts
    public let balances: Balances
    
    enum CodingKeys: String, CodingKey {
        case patronData = "PatronBasicData"
    }
    
    enum PatronCodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case title = "NameTitle"
        case firstName = "NameFirst"
        case middleName = "NameMiddle"
        case lastName = "NameLast"
        case suffix = "NameSuffix"
        case phoneNumber1 = "PhoneNumber"
        case phoneNumber2 = "PhoneNumber2"
        case phoneNumber3 = "PhoneNumber3"
        case phone1CarrierID = "Phone1CarrierID"
        case phone2CarrierID = "Phone2CarrierID"
        case phone3CarrierID = "Phone3CarrierID"
        case cellPhone = "CellPhone"
        case emailAddress1 = "EmailAddress"
        case emailAddress2 = "AltEmailAddress"
        case birthdate = "BirthDate"
        case registrationDate = "RegistrationDate"
        case lastActivityDate = "LastActivityDate"
        case addressCheckDate = "AddrCheckDate"
        case messageNewCount = "MessageNewCount"
        case messageReadCount = "MessageReadCount"
        case addresses = "PatronAddresses"
        case itemsOutCount = "ItemsOutCount"
        case itemsOverdueCount = "ItemsOverdueCount"
        case itemsOutLostCount = "ItemsOutLostCount"
        case holdRequestsTotalCount = "HoldRequestsTotalCount"
        case holdRequestsCurrentCount = "HoldRequestsCurrentCount"
        case holdRequestsShippedCount = "HoldRequestsShippedCount"
        case holdRequestsHeldCount = "HoldRequestsHeldCount"
        case holdRequestsUnclaimedCount = "HoldRequestsUnclaimedCount"
        case chargeBalance = "ChargeBalance"
        case creditBalance = "CreditBalance"
        case depositBalance = "DepositBalance"
    }
}
