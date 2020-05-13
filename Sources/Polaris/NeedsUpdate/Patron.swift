//
//  Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

//public class Patron {
//    
//    // MARK: - Typealiases
//    public typealias Address = BasicData.Address
//    public typealias Balances = BasicData.Balances
//    public typealias Emails = BasicData.Emails
//    public typealias HoldRequestCounts = BasicData.HoldRequestCounts
//    public typealias ItemCounts = BasicData.ItemCounts
//    public typealias MessageCounts = BasicData.MessageCounts
//    public typealias Name = BasicData.Name
//    public typealias Phones = BasicData.Phones
//    
//    // MARK: - Private Properties (Get/Set)
//    private var _addressCheckDate: Date?
//    private var _addresses: [Address]?
//    private var _balances: Balances?
//    private var _barcode: String?
//    private var _birthdate: Date?
//    private var _emails: Emails?
//    private var _holdRequestCounts: HoldRequestCounts?
//    private var _holdRequests: HoldRequests?
//    private var _lastActivityDate: Date?
//    private var _id: Int?
//    private var _items: Items?
//    private var _itemCounts: ItemCounts?
//    private var _messageCounts: MessageCounts?
//    private var _name: Name?
//    private var _notificationPreferences: Preferences?
//    private var _phones: Phones?
//    private var _registrationDate: Date?
//    private var _sip: Any?
//    
//    // MARK: - Public Properties (Get Only)
//    public var addressCheckDate: Date? { get { return _addressCheckDate } }
//    public var addresses: [Address]? { get { return _addresses } }
//    public var balances: Balances? { get { return _balances } }
//    public var barcode: String? { get { return _barcode } }
//    public var birthdate: Date? { get { return _birthdate } }
//    public var emails: Emails? { get { return _emails } }
//    public var holdRequestCounts: HoldRequestCounts? { get { return _holdRequestCounts } }
//    public var holdRequests: HoldRequests? { get { return _holdRequests } }
//    public var lastActivityDate: Date? { get { return _lastActivityDate } }
//    public var id: Int? { get { return _id } }
//    public var items: Items? { get { return _items } }
//    public var itemCounts: ItemCounts? { get { return _itemCounts } }
//    public var messageCounts: MessageCounts? { get { return _messageCounts } }
//    public var name: Name? { get { return _name } }
//    public var notificationPreferences: Preferences? { get { return _notificationPreferences } }
//    public var phones: Phones? { get { return _phones } }
//    public var registrationDate: Date? { get { return _registrationDate } }
//    public var sip: Any? { get { return _sip } }
//}

// MARK: - Patron + BasicData
//extension Patron {
//
//    public func addBasicData(barcode: String?, completion: @escaping () -> Void) {
//        guard let barcode = barcode else { return }
//
//        Polaris.PatronAccount.getBasicData(barcode: barcode) { [weak self] (response) in
//            self?.setBasicData(response?.basicData)
//            completion()
//        }
//    }
//
//    internal func setBasicData(_ basicData: BasicData?) {
//        guard let basicData = basicData else { return }
//
//        _addressCheckDate = basicData.addressCheckDate
//        _addresses = basicData.addresses
//        _balances = basicData.balances
//        _barcode = basicData.barcode
//        _birthdate = basicData.birthdate
//        _emails = basicData.emails
//        _holdRequestCounts = basicData.holdRequestCounts
//        _id = basicData.id
//        _itemCounts = basicData.itemCounts
//        _lastActivityDate = basicData.lastActivityDate
//        _messageCounts = basicData.messageCounts
//        _name = basicData.name
//        _phones = basicData.phones
//        _registrationDate = basicData.registrationDate
//    }
//}

// MARK: - Patron + HoldRequests
//extension Patron {
//
//    public func addHoldRequests(set: HoldRequestSet, completion: @escaping () -> Void) {
//        guard let barcode = barcode else { return }
//
//        Polaris.PatronAccount.getHoldRequests(barcode: barcode, holdRequestSet: set) { [weak self] (response) in
//            self?.setHoldRequests(response?.requests, for: set)
//            completion()
//        }
//    }
//
//    public func addHoldRequests(for sets: [HoldRequestSet], completion: @escaping () -> Void) {
//        var setsAdded = 0
//
//        for set in sets {
//            addHoldRequests(set: set) {
//                setsAdded += 1
//                if setsAdded == sets.count { completion() }
//            }
//        }
//    }
//
//    internal func setHoldRequests(_ holdRequests: [HoldRequest]?, for set: HoldRequestSet?) {
//        guard let holdRequests = holdRequests else { return }
//        guard let set = set else { return }
//
//        if _holdRequests == nil { _holdRequests = HoldRequests() }
//        _holdRequests?.append(holdRequests, to: set)
//    }
//}

// MARK: - Patron + Items
//extension Patron {
//
//    public func addItems(set: ItemSet, completion: @escaping () -> Void) {
//        guard let barcode = barcode else { return }
//
//        Polaris.PatronAccount.getItemsOut(barcode: barcode, itemSet: set) { [weak self] (response) in
//            self?.setItems(response?.items, for: set)
//            completion()
//        }
//    }
//
//    public func addItems(for sets: [ItemSet], completion: @escaping () -> Void) {
//        var setsAdded = 0
//
//        for set in sets {
//            addItems(set: set) {
//                setsAdded += 1
//                if setsAdded == sets.count { completion() }
//            }
//        }
//    }
//
//    internal func setItems(_ items: [Item]?, for set: ItemSet?) {
//        guard let items = items else { return }
//        guard let set = set else { return }
//
//        if _items == nil { _items = Items() }
//        _items?.append(items, to: set)
//    }
//}

// MARK: - Patron + Preferences
//extension Patron {
//
//    public func addNotificationPreferences(completion: @escaping () -> Void) {
//        guard let barcode = barcode else { return }
//
//        Polaris.PatronAccount.getPreferences(barcode: barcode) { [weak self] (response) in
//            self?.setNotificationPreferences(response?.preferences)
//            completion()
//        }
//    }
//
//    internal func setNotificationPreferences(_ preferences: Preferences?) {
//        _notificationPreferences = preferences
//    }
//}

// MARK: - Patron + SIP
//extension Patron {
//
//    public func setSIP(_ sip: Any?) {
//        _sip = sip
//    }
//}
