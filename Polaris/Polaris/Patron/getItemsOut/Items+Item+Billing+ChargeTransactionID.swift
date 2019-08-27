//
//  Items+Item+Billing+ChargeTransactionID.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Billing {
    public struct ChargeTransactionID {
        // MARK: - Private Properties (Get/Set)
        internal var _overdue: Int
        internal var _processing: Int
        internal var _replacement: Int
        
        // MARK: - Public Properties (Get Only)
        public var overdue: Int { get { return _overdue } }
        public var processing: Int { get { return _processing } }
        public var replacement: Int { get { return _replacement } }
    }
}
