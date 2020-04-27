//
//  Polaris+Bib+GetResponse+Row.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetResponse {
    
    public struct Row: Decodable {
        
        // MARK: - Properties
        public private(set) var alternate: Bool
        public private(set) var elementID: Int
        public private(set) var label: String
        public private(set) var occurence: Int
        public private(set) var value: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case alternate = "Alternate"
            case elementID = "ElementID"
            case label = "Label"
            case occurence = "Occurence"
            case value = "Value"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            alternate = try data.decode(Bool.self, forKey: .alternate)
            elementID = try data.decode(Int.self, forKey: .elementID)
            label = try data.decode(String.self, forKey: .label)
            occurence = try data.decode(Int.self, forKey: .occurence)
            value = try data.decode(String.self, forKey: .value)
        }
    }
}
