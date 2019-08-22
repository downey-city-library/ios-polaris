//
//  Patron+ItemCounts+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/20/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.ItemCounts {
    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case lost = "ItemsOutLostCount"
        case out = "ItemsOutCount"
        case overdue = "ItemsOverdueCount"
    }
}

extension Patron.ItemCounts: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        self._lost = try data.decode(Int.self, forKey: .lost)
        self._out = try data.decode(Int.self, forKey: .out)
        self._overdue = try data.decode(Int.self, forKey: .overdue)
    }
}
