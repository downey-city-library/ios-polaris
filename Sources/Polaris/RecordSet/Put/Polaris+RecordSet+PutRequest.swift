//
//  Polaris+RecordSet+PutRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 5/17/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.RecordSet {
 
    public struct PutRequest: Encodable {
        
        // MARK: - Required Properties
        public private(set) var patrons: String
            
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case patrons = "Records"
        }
        
        // MARK: - Initialization
        public init(patronID: Int) {
            
            self.patrons = String(patronID)
        }
        
        // MARK: - Public Setters
        public mutating func add(patronID: Int) {
            if !patrons.isEmpty {
                patrons += ",\(patronID)"
            }
        }
    }
}
