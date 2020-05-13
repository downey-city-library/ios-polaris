//
//  Polaris+Patron+PhoneCarrier.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {
    
    public enum PhoneCarrier: Int, Codable {
        
        case noCarrier = 0
        case att = 1
        case sprint = 8
        case tmobile = 9
        case verizon = 11
        
        public var id: Int { return self.rawValue }
        
        public var string: String {
            switch self {
            case .att: return "AT&T"
            case .noCarrier: return "None"
            case .sprint: return "Sprint"
            case .tmobile: return "T-Mobile"
            case .verizon: return "Verizon"
            }
        }
    }
}
