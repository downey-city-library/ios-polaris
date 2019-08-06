//
//  Patron+ItemCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public class ItemCounts {
        internal var _out: Int
        
        public var out: Int { get { return _out }}
        public let overdue: Int
        public let lost: Int
        
        internal init(out: Int, overdue: Int, lost: Int) {
            self._out = out
            self.overdue = overdue
            self.lost = lost
        }
    }
}

extension Patron.ItemCounts {
    public func setOut(to newValue: Int) { self._out = newValue }
}
