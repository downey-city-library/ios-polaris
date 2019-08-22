//
//  Patron+MessageCounts+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/20/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.MessageCounts {
    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case new = "MessageNewCount"
        case read = "MessageReadCount"
    }
}

extension Patron.MessageCounts: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        self._new = try data.decode(Int.self, forKey: .new)
        self._read = try data.decode(Int.self, forKey: .read)
    }
}
