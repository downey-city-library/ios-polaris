//
//  Patron+Balances+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/20/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Balances {
    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case charges = "ChargeBalance"
        case credits = "CreditBalance"
        case deposits = "DepositBalance"
    }
}

extension Patron.Balances: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        self._charges = try data.decode(Double.self, forKey: .charges)
        self._credits = try data.decode(Double.self, forKey: .credits)
        self._deposits = try data.decode(Double.self, forKey: .deposits)
    }
}
