//
//  AuthenticatedStaffUser+Access.swift
//  Polaris
//
//  Created by Andrew Despres on 8/19/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension AuthenticatedStaffUser {
    public struct Access {
        // MARK: - Private Properties (Get/Set)
        internal var _expirationDate: Date
        internal var _secret: String
        internal var _token: String
        
        // MARK: - Public Properties (Get Only)
        public var expirationDate: Date { get { return _expirationDate } }
        public var secret: String { get { return _secret } }
        public var token: String { get { return _token } }
    }
}
