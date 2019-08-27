//
//  Items+Item+Format.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item {
    public struct Format {
        // MARK: - Private Properties (Get/Set)
        internal var _ID: Int
        internal var _description: String
        
        // MARK: - Public Properties (Get Only)
        public var ID: Int { get { return _ID } }
        public var description: String { get { return _description } }
    }
}
