//
//  Polaris+Bib+GetHoldingsResponse+Holding+Location.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetHoldingsResponse.Holding {
    
    public struct Location {
        
        // MARK: - Public Properties
        public private(set) var ID: Int?
        public private(set) var name: String?
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case ID = "LocationID"
            case name = "LocationName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            ID = try? data.decode(Int.self, forKey: .ID)
            name = try? data.decode(String.self, forKey: .name)
        }
    }
}
