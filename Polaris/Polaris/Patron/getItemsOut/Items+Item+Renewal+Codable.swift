//
//  Items+Item+Renewal+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Renewal {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case count = "RenewalCount"
        case limit = "RenewalLimit"
        case isAvailable = "CanItemBeRenewed"
    }
}

extension Items.Item.Renewal: Decodable {
    // MARK: Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._count = try data.decode(Int.self, forKey: .count)
        self._limit = try data.decode(Int.self, forKey: .limit)
        self._isAvailable = try data.decode(Bool.self, forKey: .isAvailable)
    }
}
