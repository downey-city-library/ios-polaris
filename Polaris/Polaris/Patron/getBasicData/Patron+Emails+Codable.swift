//
//  Patron+Emails+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/21/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Emails: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        self._alternate = try? Email(from: decoder, forPrimary: false)
        self._primary = try? Email(from: decoder, forPrimary: true)
    }
}
