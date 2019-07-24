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
        public let first: String
        public let middle: String
        public let last: String
        public let title: NameTitle
        public let suffix: String
    }
}
