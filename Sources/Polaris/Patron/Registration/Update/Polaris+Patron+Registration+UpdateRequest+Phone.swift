//
//  Polaris+Patron+Registration+UpdateRequest+Phone.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Registration.UpdateRequest {
    
    public struct Phone {
        
        // MARK: - Properties
        public private(set) var carrier: Int?
        public private(set) var number: String?
        
        // MARK: - Initialization
        internal init(number: String?, carrier: Int?) {
            
            self.carrier = carrier
            self.number = number
        }
    }
}
