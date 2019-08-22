//
//  Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct Patron {
    // MARK: - Private Properties (Get/Set)
    internal var _addressCheckDate: Date?
    internal var _addresses: [Address]
    internal var _balances: Balances
    internal var _barcode: String
    internal var _birthdate: Date?
    internal var _emails: Emails
    internal var _error: PolarisError? = nil
    internal var _holdRequestCounts: HoldRequestCounts
    internal var _lastActivityDate: Date?
    internal var _items: Items? = nil
    internal var _itemCounts: ItemCounts
    internal var _messageCounts: MessageCounts
    internal var _name: Name
    internal var _phones: Phones
    internal var _registrationDate: Date?
    internal var _sip: Any? = nil
    
    // MARK: - Public Properties (Get Only)
    public var addressCheckDate: Date? { get { return _addressCheckDate } }
    public var addresses: [Address] { get { return _addresses } }
    public var balances: Balances { get { return _balances } }
    public var barcode: String { get { return _barcode } }
    public var birthdate: Date? { get { return _birthdate } }
    public var emails: Emails { get { return _emails } }
    public var error: PolarisError? { get { return _error } }
    public var holdRequestCounts: HoldRequestCounts { get { return _holdRequestCounts } }
    public var lastActivityDate: Date? { get { return _lastActivityDate } }
    public var items: Items? { get { return _items } } // this is nil unless the method getItemsOut is called and the results are then assigned to this property
    public var itemCounts: ItemCounts { get { return _itemCounts } }
    public var messageCounts: MessageCounts { get { return _messageCounts } }
    public var name: Name { get { return _name } }
    public var phones: Phones { get { return _phones } }
    public var registrationDate: Date? { get { return _registrationDate } }
    public var sip: Any? { get { return _sip } } // this is used to incorporate SIP data that is provided by an external framework
}

extension Patron {
    // MARK: - Public Mutating Methods (Setters)
    public mutating func setItems(_ items: Items) {
        self._items = items
    }
    
    public mutating func setItemCounts(lost: Int? = nil, out: Int? = nil, overdue: Int? = nil) {
        if let lost = lost { self._itemCounts._lost = lost }
        if let out = out { self._itemCounts._out = out }
        if let overdue = overdue { self._itemCounts._overdue = overdue }
    }
    
    public mutating func setSip(_ sip: Any) {
        self._sip = sip
    }
}
