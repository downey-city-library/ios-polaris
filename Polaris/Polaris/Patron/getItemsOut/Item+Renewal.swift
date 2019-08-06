//
//  Item+Renewal.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Item {
    public struct Renewal {
        
        // MARK: - Public Properties
        public let count: Int
        public let limit: Int
        public let isAvailable: Bool
    }
}
