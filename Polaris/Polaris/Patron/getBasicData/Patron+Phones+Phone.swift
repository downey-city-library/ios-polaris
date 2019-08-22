//
//  Patron+Phones+Phone.swift
//  Polaris
//
//  Created by Andrew Despres on 8/21/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Phones {
    public struct Phone {
        // MARK: - Private Properties (Get/Set)
        internal var _carrier: Carrier
        internal var _number: String
        internal var _useForTXT: Bool
        
        // MARK: - Public Properties (Get Only)
        public var carrier: Carrier { get { return _carrier } }
        public var number: String { get { return _number } }
        public var useForTXT: Bool { get { return _useForTXT } }
    }
}
