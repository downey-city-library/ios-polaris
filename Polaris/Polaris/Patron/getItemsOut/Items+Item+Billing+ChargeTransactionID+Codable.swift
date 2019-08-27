//
//  Items+Item+Billing+ChargeTransactionID+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Billing.ChargeTransactionID {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case overdue = "OverdueChargeTxnID"
        case processing = "ProcessingChargeTxnID"
        case replacement = "ReplacementChargeTxnID"
    }
}

extension Items.Item.Billing.ChargeTransactionID: Decodable {
    // MARK: Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._overdue = try data.decode(Int.self, forKey: .overdue)
        self._processing = try data.decode(Int.self, forKey: .processing)
        self._replacement = try data.decode(Int.self, forKey: .replacement)
    }
}
