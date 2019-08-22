//
//  Patron+HoldRequestCounts+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/20/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.HoldRequestCounts {
    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case current = "HoldRequestsCurrentCount"
        case held = "HoldRequestsHeldCount"
        case shipped = "HoldRequestsShippedCount"
        case total = "HoldRequestsTotalCount"
        case unclaimed = "HoldRequestsUnclaimedCount"
    }
}

extension Patron.HoldRequestCounts: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        self._current = try data.decode(Int.self, forKey: .current)
        self._held = try data.decode(Int.self, forKey: .held)
        self._shipped = try data.decode(Int.self, forKey: .shipped)
        self._total = try data.decode(Int.self, forKey: .total)
        self._unclaimed = try data.decode(Int.self, forKey: .unclaimed)
    }
}
