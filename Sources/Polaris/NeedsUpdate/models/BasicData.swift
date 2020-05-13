//
//  BasicData.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

//extension Patron {
//
//    public class BasicData: Decodable {
//
//        // MARK: - Typealiases
//        public typealias NameTitle = Patron.NameTitle
//        public typealias PhoneCarrier = Patron.PhoneCarrier
//
//        // MARK: - Private Properties (Get/Set)
//        private var _addressCheckDate: Date?
//        private var _addresses: [Address]
//        private var _balances: Balances
//        private var _barcode: String?
//        private var _birthdate: Date?
//        private var _emails: Emails
//        private var _holdRequestCounts: HoldRequestCounts
//        private var _id: Int?
//        private var _itemCounts: ItemCounts
//        private var _lastActivityDate: Date?
//        private var _messageCounts: MessageCounts
//        private var _name: Name
//        private var _phones: Phones
//        private var _registrationDate: Date?
//
//        // MARK: - Public Properties (Get Only)
//        public var addressCheckDate: Date? { get { return _addressCheckDate } }
//        public var addresses: [Address] { get { return _addresses } }
//        public var balances: Balances { get { return _balances } }
//        public var barcode: String? { get { return _barcode } }
//        public var birthdate: Date? { get { return _birthdate } }
//        public var emails: Emails { get { return _emails } }
//        public var holdRequestCounts: HoldRequestCounts { get { return _holdRequestCounts } }
//        public var id: Int? { get { return _id } }
//        public var itemCounts: ItemCounts { get { return _itemCounts } }
//        public var lastActivityDate: Date? { get { return _lastActivityDate } }
//        public var messageCounts: MessageCounts { get { return _messageCounts } }
//        public var name: Name { get { return _name } }
//        public var phones: Phones { get { return _phones } }
//        public var registrationDate: Date? { get { return _registrationDate } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case addressCheckDate = "AddrCheckDate"
//            case addresses = "PatronAddresses"
//            case barcode = "Barcode"
//            case birthdate = "BirthDate"
//            case id = "PatronID"
//            case lastActivityDate = "LastActivityDate"
//            case registrationDate = "RegistrationDate"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _addressCheckDate = (try? data.decode(String.self, forKey: .addressCheckDate))?.toDate()
//            _addresses = (try? data.decode([Address].self, forKey: .addresses)) ?? []
//            _balances = try Balances(from: decoder)
//            _barcode = try? data.decode(String.self, forKey: .barcode)
//            _birthdate = (try? data.decode(String.self, forKey: .birthdate))?.toDate()
//            _emails = try Emails(from: decoder)
//            _holdRequestCounts = try HoldRequestCounts(from: decoder)
//            _id = try? data.decode(Int.self, forKey: .id)
//            _itemCounts = try ItemCounts(from: decoder)
//            _lastActivityDate = (try? data.decode(String.self, forKey: .lastActivityDate))?.toDate()
//            _messageCounts = try MessageCounts(from: decoder)
//            _name = try Name(from: decoder)
//            _phones = try Phones(from: decoder)
//            _registrationDate = (try? data.decode(String.self, forKey: .registrationDate))?.toDate()
//        }
//    }
//}

// MARK: - Patron + Basic Data + Address
//extension Patron.BasicData {
//
//    public class Address: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _city: String?
//        private var _county: String?
//        private var _country: String?
//        private var _countryId: Int?
//        private var _id: Int?
//        private var _label: String?
//        private var _postalCode: String?
//        private var _state: String?
//        private var _streetOne: String?
//        private var _streetTwo: String?
//        private var _typeId: Int?
//        private var _zipPlusFour: String?
//
//        // MARK: - Public Properties (Get Only)
//        public var city: String? { get { return _city } }
//        public var county: String? { get { return _county } }
//        public var country: String? { get { return _country } }
//        public var countryId: Int? { get { return _countryId } }
//        public var id: Int? { get { return _id } }
//        public var label: String? { get { return _label } }
//        public var postalCode: String? { get { return _postalCode } }
//        public var state: String? { get { return _state } }
//        public var streetOne: String? { get { return _streetOne } }
//        public var streetTwo: String? { get { return _streetTwo } }
//        public var typeId: Int? { get { return _typeId } }
//        public var zipPlusFour: String? { get { return _zipPlusFour } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case city = "City"
//            case county = "County"
//            case country = "Country"
//            case countryId = "CountryID"
//            case id = "AddressID"
//            case label = "FreeTextLabel"
//            case postalCode = "PostalCode"
//            case state = "State"
//            case streetOne = "StreetOne"
//            case streetTwo = "StreetTwo"
//            case typeId = "AddressTypeID"
//            case zipPlusFour = "ZipPlusFour"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _city = (try? data.decode(String.self, forKey: .city))
//            _county = (try? data.decode(String.self, forKey: .county))
//            _country = (try? data.decode(String.self, forKey: .country))
//            _countryId = try? data.decode(Int.self, forKey: .countryId)
//            _id = try? data.decode(Int.self, forKey: .id)
//            _label = (try? data.decode(String.self, forKey: .label))
//            _postalCode = (try? data.decode(String.self, forKey: .postalCode))
//            _state = (try? data.decode(String.self, forKey: .state))
//            _streetOne = (try? data.decode(String.self, forKey: .streetOne))
//            _streetTwo = (try? data.decode(String.self, forKey: .streetTwo))
//            _typeId = try? data.decode(Int.self, forKey: .typeId)
//            _zipPlusFour = (try? data.decode(String.self, forKey: .zipPlusFour))
//        }
//    }
//}

// MARK: - Patron + Basic Data + Balances
//extension Patron.BasicData {
//
//    public class Balances: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _charges: Double?
//        private var _credits: Double?
//        private var _deposits: Double?
//
//        // MARK: - Public Properties (Get Only)
//        public var charges: Double? { get { return _charges } }
//        public var credits: Double? { get { return _credits } }
//        public var deposits: Double? { get { return _deposits } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case charges = "ChargeBalance"
//            case credits = "CreditBalance"
//            case deposits = "DepositBalance"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _charges = try? data.decode(Double.self, forKey: .charges)
//            _credits = try? data.decode(Double.self, forKey: .credits)
//            _deposits = try? data.decode(Double.self, forKey: .deposits)
//        }
//    }
//}

// MARK: - Patron + Basic Data + Emails
//extension Patron.BasicData {
//    
//    public class Emails {
//        
//        // MARK: - Private Properties (Get/Set)
//        private var _alternate: String?
//        private var _primary: String?
//        
//        // MARK: - Public Properties (Get Only)
//        public var alternate: String? { get { return _alternate } }
//        public var primary: String? { get { return _primary } }
//        
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case alternate = "AltEmailAddress"
//            case primary = "EmailAddress"
//        }
//        
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//            
//            _alternate = try? data.decode(String.self, forKey: .alternate)
//            _primary = try? data.decode(String.self, forKey: .primary)
//        }
//        
//        // MARK: - Public Setters
//        public func alternate(string: String?) {
//            guard let string = string else { return }
//            
//            _alternate = string
//        }
//        
//        public func primary(string: String?) {
//            guard let string = string else { return }
//            
//            _primary = string
//        }
//    }
//}

// MARK: - Patron + Basic Data + Hold Request Counts
//extension Patron.BasicData {
//
//    public class HoldRequestCounts: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _current: Int?
//        private var _held: Int?
//        private var _shipped: Int?
//        private var _total: Int?
//        private var _unclaimed: Int?
//
//        // MARK: - Public Properties (Get Only)
//        public var current: Int? { get { return _current } }
//        public var held: Int? { get { return _held } }
//        public var shipped: Int? { get { return _shipped } }
//        public var total: Int? { get { return _total } }
//        public var unclaimed: Int? { get { return _unclaimed } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case current = "HoldRequestsCurrentCount"
//            case held = "HoldRequestsHeldCount"
//            case shipped = "HoldRequestsShippedCount"
//            case total = "HoldRequestsTotalCount"
//            case unclaimed = "HoldRequestsUnclaimedCount"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _current = try? data.decode(Int.self, forKey: .current)
//            _held = try? data.decode(Int.self, forKey: .held)
//            _shipped = try? data.decode(Int.self, forKey: .shipped)
//            _total = try? data.decode(Int.self, forKey: .total)
//            _unclaimed = try? data.decode(Int.self, forKey: .unclaimed)
//        }
//
//        // MARK: - Internal Setters
//        internal func refresh() {
//            _held = Polaris.activePatron?.holdRequests?.held.count
//            _shipped = Polaris.activePatron?.holdRequests?.shipped.count
//            _total = Polaris.activePatron?.holdRequests?.all.count
//            _unclaimed = Polaris.activePatron?.holdRequests?.unclaimed.count
//
//            if let active = Polaris.activePatron?.holdRequests?.active, let held = Polaris.activePatron?.holdRequests?.held, let pending = Polaris.activePatron?.holdRequests?.pending {
//                _current = active.count + held.count + pending.count
//            } else {
//                _current = 0
//            }
//        }
//    }
//}

// MARK: - Patron + Basic Data + Item Counts
//extension Patron.BasicData {
//
//    public class ItemCounts: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _lost: Int?
//        private var _out: Int?
//        private var _overdue: Int?
//
//        // MARK: - Public Properties (Get Only)
//        public var lost: Int? { get { return _lost } }
//        public var out: Int? { get { return _out } }
//        public var overdue: Int? { get { return _overdue } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case lost = "ItemsOutLostCount"
//            case out = "ItemsOutCount"
//            case overdue = "ItemsOverdueCount"
//        }
//
//        // MARK: - Initialization
//        required public init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _lost = try? data.decode(Int.self, forKey: .lost)
//            _out = try? data.decode(Int.self, forKey: .out)
//            _overdue = try? data.decode(Int.self, forKey: .overdue)
//        }
//
//        // MARK: - Internal Setters
//        internal func refresh() {
//            _lost = Polaris.activePatron?.items?.lost.count
//            _out = Polaris.activePatron?.items?.out.count
//            _overdue = Polaris.activePatron?.items?.overdue.count
//        }
//    }
//}

// MARK: - Patron + Basic Data + MessageCounts
//extension Patron.BasicData {
//
//    public class MessageCounts: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _new: Int?
//        private var _read: Int?
//
//        // MARK: - Public Properties (Get Only)
//        public var new: Int? { get { return _new } }
//        public var read: Int? { get { return _read } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case new = "MessageNewCount"
//            case read = "MessageReadCount"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _new = try? data.decode(Int.self, forKey: .new)
//            _read = try? data.decode(Int.self, forKey: .read)
//        }
//    }
//}

// MARK: - Patron + Basic Data + Name
//extension Patron.BasicData {
//
//    public class Name: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _first: String?
//        private var _last: String?
//        private var _middle: String?
//        private var _suffix: String?
//        private var _title: NameTitle?
//
//        // MARK: - Public Properties (Get Only)
//        public var first: String? { get { return _first } }
//        public var last: String? { get { return _last } }
//        public var middle: String? { get { return _middle } }
//        public var suffix: String? { get { return _suffix } }
//        public var title: NameTitle? { get { return _title } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case first = "NameFirst"
//            case last = "NameLast"
//            case middle = "NameMiddle"
//            case suffix = "NameSuffix"
//            case title = "NameTitle"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _first = try? data.decode(String.self, forKey: .first)
//            _last = try? data.decode(String.self, forKey: .last)
//            _middle = (try? data.decode(String.self, forKey: .middle))
//            _suffix = (try? data.decode(String.self, forKey: .suffix))
//            _title = (try? data.decode(NameTitle.self, forKey: .title))
//        }
//    }
//}

// MARK: - Patron + Basic Data + Phone
//extension Patron.BasicData {
//
//    public class Phone {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _carrier: PhoneCarrier
//        private var _number: String?
//
//        // MARK: - Public Properties (Get Only)
//        public var carrier: PhoneCarrier { get { return _carrier } }
//        public var number: String? { get { return _number } }
//
//        // MARK: - Initialization
//        internal init(number: String?, carrier: Int?) {
//            if let carrier = carrier { _carrier = PhoneCarrier(rawValue: carrier) ?? .noCarrier }
//            else { _carrier = .noCarrier }
//            _number = number
//        }
//
//        // MARK: - Public Setters
//        public func carrier(id: Int?) {
//            guard let id = id else { return }
//
//            _carrier = PhoneCarrier(rawValue: id) ?? .noCarrier
//        }
//
//        public func number(string: String?) {
//            guard let string = string else { return }
//
//            _number = string
//        }
//    }
//}

// MARK: - Patron + Basic Data + Phones
//extension Patron.BasicData {
//
//    public class Phones: Decodable {
//
//        // MARK: - Private Properties (Get/Set)
//        private var _cell: String?
//        private var _phone1: Phone
//        private var _phone2: Phone
//        private var _phone3: Phone
//
//        // MARK: - Public Properties (Get Only)
//        public var cell: String? { get { return _cell } }
//        public var phone1: Phone { get { return _phone1 } }
//        public var phone2: Phone { get { return _phone2 } }
//        public var phone3: Phone { get { return _phone3 } }
//
//        // MARK: - Coding Keys
//        private enum CodingKeys: String, CodingKey {
//
//            case carrier1 = "Phone1CarrierID"
//            case carrier2 = "Phone2CarrierID"
//            case carrier3 = "Phone3CarrierID"
//            case cell = "CellPhone"
//            case number1 = "PhoneNumber"
//            case number2 = "PhoneNumber2"
//            case number3 = "PhoneNumber3"
//        }
//
//        // MARK: - Initialization
//        public required init(from decoder: Decoder) throws {
//            let data = try decoder.container(keyedBy: CodingKeys.self)
//
//            _cell = try? data.decode(String.self, forKey: .cell)
//
//            let carrier1 = try? data.decode(Int.self, forKey: .carrier1)
//            let carrier2 = try? data.decode(Int.self, forKey: .carrier2)
//            let carrier3 = try? data.decode(Int.self, forKey: .carrier3)
//
//            let number1 = try? data.decode(String.self, forKey: .number1)
//            let number2 = try? data.decode(String.self, forKey: .number2)
//            let number3 = try? data.decode(String.self, forKey: .number3)
//
//            _phone1 = Phone(number: number1, carrier: carrier1)
//            _phone2 = Phone(number: number2, carrier: carrier2)
//            _phone3 = Phone(number: number3, carrier: carrier3)
//        }
//    }
//}
