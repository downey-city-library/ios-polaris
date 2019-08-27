//
//  Items+Item+Billing+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Billing {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case noticeSent = "BillingNoticeSent"
    }
}

extension Items.Item.Billing: Decodable {
    // MARK: Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._chargeTransactionID = try ChargeTransactionID(from: decoder)
        self._wasNoticeSent = try data.decode(Bool.self, forKey: .noticeSent)
    }
}
