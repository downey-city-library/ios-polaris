//
//  Polaris+Bib+GetHoldingsResponse+Holding+ItemCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetHoldingsResponse.Holding {
    
    public struct ItemCounts {
        
        // MARK: - Public Properties
        public private(set) var `in`: Int?
        public private(set) var total: Int?
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {
            
            case `in` = "ItemsIn"
            case total = "ItemsTotal"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            `in` = try? data.decode(Int.self, forKey: .in)
            total = try? data.decode(Int.self, forKey: .total)
        }
        
        public init(`in`: Int? = nil, total: Int? = nil) {
            self.in = `in`
            self.total = total
        }
    }
}
