//
//  Patron+ItemCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct ItemCounts {
        // MARK: - Private Properties (Get/Set)
        internal var _lost: Int
        internal var _out: Int
        internal var _overdue: Int
        
        // MARK: - Public Properties (Get Only)
        public var lost: Int { get { return _lost } }
        public var out: Int { get { return _out } }
        public var overdue: Int { get { return _overdue } }
    }
}
