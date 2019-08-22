//
//  Patron+Phones.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation
extension Patron {
    public struct Phones {
        // MARK: - Private Properties (Get/Set)
        internal var _phone1: Phone?
        internal var _phone2: Phone?
        internal var _phone3: Phone?
        
        // MARK: - Public Properties (Get Only)
        public var phone1: Phone? { get { return _phone1 } }
        public var phone2: Phone? { get { return _phone2 } }
        public var phone3: Phone? { get { return _phone3 } }
    }
}
