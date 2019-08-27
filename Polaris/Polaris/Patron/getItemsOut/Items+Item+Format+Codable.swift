//
//  Items+Item+Format+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Format {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case ID = "FormatID"
        case description = "FormatDescription"
    }
}

extension Items.Item.Format: Decodable {
    // MARK: Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._ID = try data.decode(Int.self, forKey: .ID)
        self._description = try data.decode(String.self, forKey: .description)
    }
}
