//
//  Polaris+Patron+BasicDataResponse+BasicData+Balances.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Balances: Decodable {
        
        // MARK: - Properties
        public private(set) var charges: Double?
        public private(set) var credits: Double?
        public private(set) var deposits: Double?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case charges = "ChargeBalance"
            case credits = "CreditBalance"
            case deposits = "DepositBalance"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            charges = try? data.decode(Double.self, forKey: .charges)
            credits = try? data.decode(Double.self, forKey: .credits)
            deposits = try? data.decode(Double.self, forKey: .deposits)
        }
    }
}
