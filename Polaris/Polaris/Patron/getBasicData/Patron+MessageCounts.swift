//
//  Patron+MessageCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct MessageCounts {
        // MARK: - Private Properties (Get/Set)
        internal var _new: Int
        internal var _read: Int
        
        // MARK: - Public Properties (Get Only)
        public var new: Int { get { return _new } }
        public var read: Int { get { return _read } }
    }
}
