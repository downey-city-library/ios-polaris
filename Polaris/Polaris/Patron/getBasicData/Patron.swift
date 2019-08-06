//
//  Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct Patron {
    internal var _items: Items
    internal var _itemCounts: ItemCounts
    
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
    public var itemCounts: ItemCounts { get { return _itemCounts } }
    public let holdRequestCounts: HoldRequestCounts
    public let balances: Balances
    
    // this next field is used to incorporate SIP data that is provided by an external framework
    public var sip: Any? = nil
    
    // this next property is only not nil if the method getItemsOut is called and the results are then assigned to this property
    public var items: Items { get { return _items } }
    
    public mutating func setItems(_ items: Items) {
        self._items = items
    }
    
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
