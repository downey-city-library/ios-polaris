//
//  Items+Item+Renewal.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item {
    public struct Renewal {
        // MARK: - Private Properties (Get/Set)
        internal var _count: Int
        internal var _limit: Int
        internal var _isAvailable: Bool
        
        // MARK: - Public Properties (Get Only)
        public var count: Int { get { return _count } }
        public var limit: Int { get { return _limit } }
        public var isAvailable: Bool { get { return _isAvailable } }
    }
}
