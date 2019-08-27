//
//  Items+Item.swift
//  Polaris
//
//  Created by Andrew Despres on 8/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items {
    public struct Item {
        // MARK: - Private Properties (Get/Set)
        internal var _assignedBranch: Branch?
        internal var _barcode: String
        internal var _bib: Bib
        internal var _billing: Billing?
        internal var _callNumber: String
        internal var _checkoutDate: Date?
        internal var _designation: String?
        internal var _dueDate: Date?
        internal var _format: Format?
        internal var _ID: Int?
        internal var _isElectronic: Bool?
        internal var _isVisibleInPAC: Bool?
        internal var _loaningBranch: Branch?
        internal var _renewal: Renewal?
        internal var _vendor: Vendor?
        
        // MARK: - Public Properties (Get Only)
        public var assignedBranch: Branch? { get { return _assignedBranch } }
        public var barcode: String { get { return _barcode } }
        public var bib: Bib { get { return _bib } }
        public var billing: Billing? { get { return _billing } }
        public var callNumber: String { get { return _callNumber } }
        public var checkoutDate: Date? { get { return _checkoutDate } }
        public var designation: String? { get { return _designation } }
        public var dueDate: Date? { get { return _dueDate } }
        public var format: Format? { get { return _format } }
        public var ID: Int? { get { return _ID } }
        public var isElectronic: Bool? { get { return _isElectronic } }
        public var isVisibleInPAC: Bool? { get { return _isVisibleInPAC } }
        public var loaningBranch: Branch?  { get { return _loaningBranch } }
        public var renewal: Renewal? { get { return _renewal } }
        public var vendor: Vendor? { get { return _vendor } }
    }
}
