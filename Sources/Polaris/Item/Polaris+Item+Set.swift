//
//  Polaris+Item+Set.swift
//  Polaris
//
//  Created by Andrew Despres on 11/2/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Item {
    
    public enum Set: String {
        
        case all = "all"
        case lost = "lost"
        case overdue = "overdue"
        
        public var string: String { return self.rawValue }
    }
}
