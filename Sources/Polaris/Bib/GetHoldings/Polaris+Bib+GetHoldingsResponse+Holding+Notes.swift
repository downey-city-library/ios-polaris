//
//  Polaris+Bib+GetHoldingsResponse+Holding+Notes.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetHoldingsResponse.Holding {
    
    public struct Notes {
        
        // MARK: - Public Properties
        public private(set) var holdings: String?
        public private(set) var `public`: String?
        public private(set) var textualHoldings: String?
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case holdings = "HoldingsNote"
            case `public` = "PublicNote"
            case textualHoldings = "TextualHoldingsNote"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            holdings = try? data.decode(String.self, forKey: .holdings)
            `public` = try? data.decode(String.self, forKey: .public)
            textualHoldings = try? data.decode(String.self, forKey: .textualHoldings)
        }
    }
}
