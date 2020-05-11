//
//  Polaris+HoldRequest+ReplyRequest+Answer.swift
//  Polaris
//
//  Created by Andrew Despres on 5/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest.ReplyRequest {
    
    public enum Answer: Int {
        case no = 0
        case yes = 1
        
        public var int: Int { return self.rawValue }
    }
}
