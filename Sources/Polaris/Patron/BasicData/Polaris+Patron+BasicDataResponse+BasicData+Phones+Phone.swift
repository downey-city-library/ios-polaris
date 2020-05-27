//
//  Polaris+Patron+BasicDataResponse+BasicData+Phones+Phone.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Phone {
        
        // MARK: - Properties
        public private(set) var carrier: Int?
        public private(set) var number: String?
        
        // MARK: - Initialization
        internal init(number: String?, carrier: Int?) {

            self.carrier = carrier
            self.number = number
        }
        
        // MARK: - Public Setters
        public mutating func set(carrier ID: Int?) {
            guard let ID = ID else { return }

            self.carrier = ID
        }
        
        public mutating func set(number: String?) {
            guard let number = number else { return }

            self.number = number
        }
    }
}
