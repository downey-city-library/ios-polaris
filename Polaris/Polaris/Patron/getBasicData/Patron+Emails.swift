//
//  Patron+Emails.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct Emails {
        // MARK: - Private Properties (Get/Set)
        internal var _alternate: Email?
        internal var _primary: Email?
        
        // MARK: - Public Properties (Get Only)
        public var alternate: Email? { get { return _alternate } }
        public var primary: Email? { get { return _primary } }
    }
}
