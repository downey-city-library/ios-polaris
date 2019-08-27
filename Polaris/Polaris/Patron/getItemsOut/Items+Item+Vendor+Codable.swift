//
//  Items+Item+Vendor+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Vendor {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case accountName = "VendorAccountName"
        case ID = "VendorObjectIdentifier"
        case name = "VendorName"
    }
}

extension Items.Item.Vendor: Decodable {
    // MARK: Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._accountName = try? data.decode(String.self, forKey: .accountName)
        self._ID = try? data.decode(Int.self, forKey: .ID)
        self._name = try? data.decode(String.self, forKey: .name)
    }
}
