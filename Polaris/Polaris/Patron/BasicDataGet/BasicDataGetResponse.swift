//
//  BasicDataGetResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 6/7/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct BasicDataGetResponse: Codable {
    public let patronBasicData: PatronBasicData
    
    fileprivate enum CodingKeys: String, CodingKey {
        case patronBasicData = "PatronBasicData"
    }
}

public struct PatronBasicData: Codable {
    public let barcode: String
    public let nameFirst: String
    public let nameMiddle: String?
    public let nameLast: String
    public let nameTitle: String?
    public let nameSuffix: String?
    public let phoneNumber: String?
    public let phoneNumber2: String?
    public let phoneNumber3: String?
    public let phone1CarrierID: Int?
    public let phone2CarrierID: Int?
    public let phone3CarrierID: Int?
    public let cellPhone: String?
    public let cellPhoneCarrierID: Int?
    public let emailAddress: String?
    public let altEmailAddress: String?
    public let birthdate: String?
    public let registrationDate: String?
    public let lastActivityDate: String?
    public let addrCheckDate: String?
    public let messageNewCount: Int
    public let messageReadCount: Int
    public let patronAddresses: String?
    public let itemsOutCount: Int
    public let itemsOverdueCount: Int
    public let itemsOutLostCount: Int
    public let holdRequestsTotalCount: Int
    public let holdRequestsCurrentCount: Int
    public let holdRequestsShippedCount: Int
    public let holdRequestsHeldCount: Int
    public let holdRequestsUnclaimedCount: Int
    public let chargeBalance: Double
    public let creditBalance: Double
    public let depositBalance: Double
    
    fileprivate enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case nameFirst = "NameFirst"
        case nameMiddle = "NameMiddle"
        case nameLast = "NameLast"
        case nameTitle = "NameTitle"
        case nameSuffix = "NameSuffix"
        case phoneNumber = "PhoneNumber"
        case phoneNumber2 = "PhoneNumber2"
        case phoneNumber3 = "PhoneNumber3"
        case phone1CarrierID = "Phone1CarrierID"
        case phone2CarrierID = "Phone2CarrierID"
        case phone3CarrierID = "Phone3CarrierID"
        case cellPhone = "CellPhone"
        case cellPhoneCarrierID = "CellPhoneCarrierID"
        case emailAddress = "EmailAddress"
        case altEmailAddress = "AltEmailAddress"
        case birthdate = "BirthDate"
        case registrationDate = "RegistrationDate"
        case lastActivityDate = "LastActivityDate"
        case addrCheckDate = "AddrCheckDate"
        case messageNewCount = "MessageNewCount"
        case messageReadCount = "MessageReadCount"
        case patronAddresses = "PatronAddresses"
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
