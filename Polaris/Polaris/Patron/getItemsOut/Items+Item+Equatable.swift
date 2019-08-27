//
//  Items+Item+Equatable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item: Equatable {
    public static func == (lhs: Items.Item, rhs: Items.Item) -> Bool {
        return lhs.barcode == rhs.barcode
    }
}
