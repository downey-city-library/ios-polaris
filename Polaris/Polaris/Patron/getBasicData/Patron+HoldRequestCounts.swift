//
//  Patron+HoldRequestCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct HoldRequestCounts {
        // MARK: - Private Properties (Get/Set)
        internal var _current: Int
        internal var _held: Int
        internal var _shipped: Int
        internal var _total: Int
        internal var _unclaimed: Int
        
        // MARK: - Public Properties (Get Only)
        public var current: Int { get { return _current } }
        public var held: Int { get { return _held } }
        public var shipped: Int { get { return _shipped } }
        public var total: Int { get { return _total } }
        public var unclaimed: Int { get { return _unclaimed } }
    }
}
