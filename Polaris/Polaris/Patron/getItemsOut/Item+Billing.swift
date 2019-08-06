//
//  Item+Billing.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Item {
    public struct Billing {
        
        // MARK: - Public Properties
        public let wasNoticeSent: Bool
        public let chargeTransactionID: ChargeTransactionID
    }
}

extension Item.Billing {
    public struct ChargeTransactionID {
        
        // MARK: - Public Properties
        public let overdue: Int
        public let processing: Int
        public let replacement: Int
    }
}
