//
//  Patron+Address.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct Address {
        // MARK: - Private Properties (Get/Set)
        internal var _ID: Int
        internal var _label: String
        internal var _streetOne: String
        internal var _streetTwo: String
        internal var _city: String
        internal var _state: String
        internal var _county: String
        internal var _postalCode: String
        internal var _zipPlusFour: String
        internal var _country: String
        internal var _countryID: Int
        internal var _typeID: Int
        
        // MARK: - Public Properties (Get Only)
        public var ID: Int { get { return _ID } }
        public var label: String { get { return _label } }
        public var streetOne: String { get { return _streetOne } }
        public var streetTwo: String { get { return _streetTwo } }
        public var city: String { get { return _city } }
        public var state: String { get { return _state } }
        public var county: String { get { return _county } }
        public var postalCode: String { get { return _postalCode } }
        public var zipPlusFour: String { get { return _zipPlusFour } }
        public var country: String { get { return _country } }
        public var countryID: Int { get { return _countryID } }
        public var typeID: Int { get { return _typeID } }
    }
}
