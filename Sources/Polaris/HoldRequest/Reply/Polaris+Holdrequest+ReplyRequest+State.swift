//
//  Polaris+HoldRequest+ReplyRequest+State.swift
//  Polaris
//
//  Created by Andrew Despres on 5/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest.ReplyRequest {
    
    public enum State: Int {
        case availableLocally = 1
        case illPolicy = 2
        case existingHolds = 3
        case noItems = 4
        case localPolicy = 5
        
        public var int: Int { return self.rawValue }
    }
}
