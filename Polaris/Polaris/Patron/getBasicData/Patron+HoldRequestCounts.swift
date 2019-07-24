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
        public let total: Int
        public let current: Int
        public let shipped: Int
        public let held: Int
        public let unclaimed: Int
    }
}
