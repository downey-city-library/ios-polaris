//
//  Polaris+Bib+GetResponse+Titles.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetResponse {
    
    public struct Titles {
        
        // MARK: - Properties
        public private(set) var added: [String] = []
        public private(set) var uniform: String?
        public private(set) var main: String?
        public private(set) var former: String?
        public private(set) var later: String?
        
        // MARK: - Setters
        mutating func setAdded(to value: String) {
            added.append(value)
        }
        
        mutating func setUniform(to value: String) {
            uniform = value
        }
        
        mutating func setMain(to value: String) {
            main = value
        }
        
        mutating func setFormer(to value: String) {
            former = value
        }
        
        mutating func setLater(to value: String) {
            later = value
        }
    }
}
