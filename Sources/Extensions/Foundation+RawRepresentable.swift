//
//  Foundation+RawRepresentable.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension RawRepresentable where RawValue: Decodable {
    
    init(from decoder: Decoder, default: Self) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        self = Self(rawValue: rawValue) ?? `default`
    }
}
