//
//  Patron+Emails+Email.swift
//  Polaris
//
//  Created by Andrew Despres on 8/21/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Emails {
    public struct Email {
        // MARK: - Private Properties (Get/Set)
        internal var _address: String
        
        // MARK: - Public Properties (Get Only)
        public var address: String { get { return _address } }
    }
}
