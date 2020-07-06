//
//  Polaris+Patron+Blocks+CirculationResponse+Name.swift
//  Polaris
//
//  Created by Andrew Despres on 4/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Blocks.CirculationResponse {
    
    public struct Name: Decodable {
        
        // MARK: - Properties
        public private(set) var first: String
        public private(set) var last: String
        public private(set) var middle: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case first = "NameFirst"
            case last = "NameLast"
            case middle = "NameMiddle"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            first = try data.decode(String.self, forKey: .first)
            last = try data.decode(String.self, forKey: .last)
            middle = try? data.decode(String.self, forKey: .middle)
        }
        
        public init(first: String, last: String, middle: String? = nil) {
            self.first = first
            self.last = last
            self.middle = middle
        }
    }
}
