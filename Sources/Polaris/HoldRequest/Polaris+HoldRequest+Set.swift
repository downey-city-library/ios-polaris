//
//  Polaris+HoldRequest+Set.swift
//  Polaris
//
//  Created by Andrew Despres on 10/31/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {
    
    public enum Set: String {
        
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
