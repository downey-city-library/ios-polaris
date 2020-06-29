//
//  Polaris+Bib+GetHoldingsResponse+Holding+Statements.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetHoldingsResponse.Holding {
    
    public struct Statements {
        
        // MARK: - Public Properties
        public private(set) var holdings: String?
        public private(set) var retention: String?
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {
            
            case holdings = "HoldingsStatement"
            case retention = "RetentionStatement"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            holdings = try? data.decode(String.self, forKey: .holdings)
            retention = try? data.decode(String.self, forKey: .retention)
        }
        
        public init(holdings: String? = nil, retention: String? = nil) {
            self.holdings = holdings
            self.retention = retention
        }
    }
}
