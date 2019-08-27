//
//  Items+Item+Vendor.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item {
    public struct Vendor {
        // MARK: - Private Properties (Get/Set)
        internal var _accountName: String?
        internal var _ID: Int?
        internal var _name: String?
        
        // MARK: - Properties (Get Only)
        public var accountName: String? { get { return _accountName } }
        public var ID: Int? { get { return _ID } }
        public var name: String? { get { return _name } }
    }
}
