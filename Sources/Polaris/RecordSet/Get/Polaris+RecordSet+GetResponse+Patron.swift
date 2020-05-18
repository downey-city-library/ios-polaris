//
//  Polaris+RecordSet+GetResponse+Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 5/17/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.RecordSet.GetResponse {
    
    public struct Patron: Decodable {
        
        // MARK: - Properties
        public private(set) var ID: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case ID = "PatronID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            ID = try data.decode(Int.self, forKey: .ID)
        }
    }
}
