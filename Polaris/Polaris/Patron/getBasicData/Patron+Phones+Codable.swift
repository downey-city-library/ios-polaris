//
//  Patron+Phones+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/21/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Phones: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        self._phone1 = try? Phone(from: decoder, forIndex: 1)
        self._phone2 = try? Phone(from: decoder, forIndex: 2)
        self._phone3 = try? Phone(from: decoder, forIndex: 3)
    }
}
