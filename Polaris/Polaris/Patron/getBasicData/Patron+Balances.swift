//
//  Patron+Balances.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct Balances {
        // MARK: - Private Properties (Get/Set)
        internal var _charges: Double
        internal var _credits: Double
        internal var _deposits: Double
        
        // MARK: - Public Properties (Get Only)
        public var charges: Double { get { return _charges } }
        public var credits: Double { get { return _credits } }
        public var deposits: Double { get { return _deposits } }
    }
}
