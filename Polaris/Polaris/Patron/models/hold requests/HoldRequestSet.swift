//
//  HoldRequestSet.swift
//  Polaris
//
//  Created by Andrew Despres on 10/31/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    
    public enum HoldRequestSet: String {
        
        case active = "active"
        case all = "all"
        case cancelled = "cancelled"
        case expired = "expired"
        case held = "held"
        case inactive = "inactive"
        case notSupplied = "notsupplied"
        case pending = "pending"
        case shipped = "shipped"
        case unclaimed = "unclaimed"
        
        public var string: String { return self.rawValue }
    }
}
