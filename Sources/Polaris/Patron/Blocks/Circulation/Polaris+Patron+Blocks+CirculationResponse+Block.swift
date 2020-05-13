//
//  Polaris+Patron+Blocks+CirculationResponse+Block.swift
//  Polaris
//
//  Created by Andrew Despres on 4/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Blocks.CirculationResponse {
    
    public struct Block: Decodable {
        
        // MARK: - Properties
        public private(set) var description: String
        public private(set) var patronId: Int
        public private(set) var patronName: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case description = "BlockDescription"
            case patronId = "PatronID"
            case patronName = "PatronName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            description = try data.decode(String.self, forKey: .description)
            patronId = try data.decode(Int.self, forKey: .patronId)
            patronName = try data.decode(String.self, forKey: .patronName)
        }
    }
}
