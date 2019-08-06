//
//  Item+Equatable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Item: Equatable {
    public static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.barcode == rhs.barcode
    }
}
