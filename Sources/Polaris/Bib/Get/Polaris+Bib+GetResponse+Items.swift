//
//  Polaris+Bib+GetResponse+Items.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetResponse {
    
    public struct Items {
        
        // MARK: - Properties
        public var local = Counts()
        public var system = Counts()
    }
}

extension Polaris.Bib.GetResponse.Items {
    
    public struct Counts {
        
        // MARK: - Properties
        public private(set) var available: Int?
        public private(set) var total: Int?
        
        // MARK: - Setters
        mutating func setAvailable(to value: String) {
            available = Int(value)
        }
        
        mutating func setTotal(to value: String) {
            total = Int(value)
        }
    }
}
