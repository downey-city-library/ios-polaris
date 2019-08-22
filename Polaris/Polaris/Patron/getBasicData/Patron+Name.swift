//
//  Patron+Name.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct Name {
        // MARK: - Private Properties (Get/Set)
        internal var _first: String
        internal var _last: String
        internal var _middle: String
        internal var _suffix: String
        internal var _title: Title
        
        // MARK: - Public Properties (Get Only)
        public var first: String { get { return _first } }
        public var last: String { get { return _last } }
        public var middle: String { get { return _middle } }
        public var suffix: String { get { return _suffix } }
        public var title: Title { get { return _title } }
    }
}
